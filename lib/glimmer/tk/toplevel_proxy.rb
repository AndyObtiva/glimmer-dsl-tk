# Copyright (c) 2020-2022 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'glimmer/tk/widget_proxy'

module Glimmer
  module Tk
    # Proxy for TkToplevel
    #
    # Follows the Proxy Design Pattern
    class ToplevelProxy < WidgetProxy
      REGEX_GEOMETRY = /[x+-]/
      DEFAULT_WIDTH = 190
      DEFAULT_HEIGHT = 0
      
      attr_reader :tk
      attr_accessor :escapable, :modal, :centered
      alias escapable? escapable
      alias modal? modal
      alias centered? centered

      def post_add_content
        if escapable?
           on('KeyPress') do |event|
            if event.state == 0 && event.keysym == 'Escape'
              tk.grab_release
              destroy
            end
          end
        end

        if modal?
          unless is_a?(Glimmer::Tk::ToplevelProxy)
            raise 'Modal windows must be top level windows. Root cannot be modal.'
          end

          center_within_root unless @x || @y
          root_parent_proxy.withdraw
          tk.grab_set
          on('WM_DELETE_WINDOW') do
            tk.grab_release
            root_parent_proxy.deiconify
            destroy
            true
          end
          on('destroy') do
            tk.grab_release
            root_parent_proxy.deiconify
            true
          end
        else
          center_within_screen unless @x || @y
        end

        if is_a?(Glimmer::Tk::ToplevelProxy) && @tk.iconphoto.nil? && root_parent_proxy.iconphoto
          @tk.iconphoto = root_parent_proxy.iconphoto
        end
      end
      
      def has_attribute?(attribute, *args)
        %w[width height x y icon_photo].include?(attribute.to_s) || super
      end
      
      def set_attribute(attribute, *args)
        case attribute.to_s
        when 'iconphoto', 'icon_photo'
          args[0..-1] = [image_argument(args)]
          super('iconphoto', *args)
        when 'resizable'
          if args.size == 1 && !args.first.is_a?(Array)
            self.resizable = [args.first]*2
          else
            super
          end
        else
          super
        end
      end
      
      def get_attribute(attribute)
        case attribute.to_s
        when 'icon_photo'
          super('iconphoto')
        else
          super
        end
      end
      
      def icon_photo
        iconphoto
      end
      
      def width
        geometry.split(REGEX_GEOMETRY)[0].to_i
      end
      
      def height
        geometry.split(REGEX_GEOMETRY)[1].to_i
      end
      
      def x
        sign_number(x_sign, geometry.split(REGEX_GEOMETRY)[2].to_i)
      end
      
      def y
        sign_number(y_sign, geometry.split(REGEX_GEOMETRY)[3].to_i)
      end
      
      def width=(value)
        @width = value.to_i
        self.geometry = "#{value.to_i}x#{@height || DEFAULT_HEIGHT}#{x_sign}#{abs_x}#{y_sign}#{abs_y}"
      end
      
      def height=(value)
        @height = value.to_i
        self.geometry = "#{@width || DEFAULT_WIDTH}x#{value.to_i}#{x_sign}#{abs_x}#{y_sign}#{abs_y}"
      end
      
      def x=(value)
        @x = value
        self.geometry = "#{@width || DEFAULT_WIDTH}x#{@height || DEFAULT_HEIGHT}#{value.to_i > 0 ? '+' : '-'}#{value.to_i.abs}#{y_sign}#{abs_y}"
      end
      
      def y=(value)
        @y = value
        self.geometry = "#{@width || DEFAULT_WIDTH}x#{@height || DEFAULT_HEIGHT}#{x_sign}#{abs_x}#{value.to_i > 0 ? '+' : '-'}#{value.to_i.abs}"
      end
      
      def handle_listener(listener_name, &listener)
        case listener_name.to_s.upcase
        when 'WM_DELETE_WINDOW', 'DELETE_WINDOW'
          listener_name = 'WM_DELETE_WINDOW'
          @tk.protocol(listener_name, &listener)
        else
          super
        end
      end

      def center_within_screen
        monitor_width, monitor_height = wm_maxsize
        update :idletasks
        current_width = width
        current_height = height

        if RbConfig::CONFIG['host_os'] == 'linux'
          begin
            # example output: HDMI-A-0 connected primary 2560x1080+1024+100 (normal left inverted right x axis y axis) 798mm x 334mm
            # TODO: is xrandr output same on all systems?
            sizes = `xrandr`
                      .split("\n")
                      .find { |line| line.include?(' connected primary ') }
                      &.match(/([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+)/)
            raise "`xrandr` returned unexpected results. Try to run `xrandr`, verify it's output and possibly update this code." unless sizes

            self.x = (sizes[1].to_i - width) / 2 + sizes[3].to_i
            self.y = (sizes[2].to_i - height) / 2 + sizes[4].to_i

          rescue StandardError => e
            Glimmer::Config.logger.debug {"Unable to detect primary screen on Linux with xrandr"}
            Glimmer::Config.logger.debug {e.full_message}

            self.x = (winfo_screenwidth - width) / 2
            self.y = (winfo_screenheight - height) / 2
          end

        else
          self.x = (winfo_screenwidth - width) / 2
          self.y = (winfo_screenheight - height) / 2
        end

        self.width = width
        self.height = height
      end

      def center_within_root(margin: 0)
        self.x = root_parent_proxy.x + margin
        self.y = root_parent_proxy.y + margin
        self.width = root_parent_proxy.width - 2 * margin
        self.height = root_parent_proxy.height - 2 * margin
      end

      def window?
        true
      end

      [:visible,  :hidden,  :enabled,  :disabled,
       :visible=, :hidden=, :enabled=, :disabled=,
       :visible?, :hidden?, :enabled?, :disabled?].each \
      do |restricted_method|
        define_method(restricted_method) do
          # TODO: or just do nothing?
          raise 'Not applicable for a root / toplevel'
        end
      end

      def closest_window
        self
      end

      private
      
      def sign_number(sign, number)
        "#{sign}1".to_i * number
      end
      
      def abs_x
        geometry.split(REGEX_GEOMETRY)[2].to_i
      end
      
      def abs_y
        geometry.split(REGEX_GEOMETRY)[3].to_i
      end
      
      def x_sign
        geometry_signs[0]
      end
      
      def y_sign
        geometry_signs[1]
      end
      
      def geometry_signs
        geometry.chars.select {|char| char.match(/[+-]/)}
      end
      
      def initialize_defaults
        self.background = '#ececec' if OS.mac?
        on('DELETE_WINDOW') do
          grab_release
          destroy
        end
      end
      
      def mac_style=(mac_class, mac_attribute_list = nil)
        if OS.mac?
          @mac_style = [mac_class, mac_attribute_list]
          ::Tk.tk_call("::tk::unsupported::MacWindowStyle", "style", @tk, *@mac_style.compact)
        end
      end
      
      def mac_style
        @mac_style
      end
    end
  end
end
