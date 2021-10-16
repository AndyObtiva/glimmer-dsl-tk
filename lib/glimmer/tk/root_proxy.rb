# Copyright (c) 2020-2021 Andy Maleh
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
    # Proxy for TkRoot
    #
    # Follows the Proxy Design Pattern
    class RootProxy < WidgetProxy
      REGEX_GEOMETRY = /[x+-]/
      DEFAULT_WIDTH = 190
      DEFAULT_HEIGHT = 95
      
      def initialize(*args, &block)
        @tk = ::TkRoot.new
        @tk.minsize = DEFAULT_WIDTH, DEFAULT_HEIGHT
        initialize_defaults
        post_add_content if block.nil?
      end

      def post_add_content
        set_attribute('iconphoto', File.expand_path('../../../icons/glimmer.png', __dir__)) if @tk.iconphoto.nil?
      end
      
      def open
        start_event_loop
      end

      def content(&block)
        Glimmer::DSL::Engine.add_content(self, Glimmer::DSL::Tk::RootExpression.new, keyword, *args, &block)
      end
      
      def has_attribute?(attribute, *args)
        %w[width height x y].include?(attribute.to_s) || super
      end
      
      def set_attribute(attribute, *args)
        case attribute.to_s
        when 'iconphoto'
          args[0..-1] = [image_argument(args)]
          super
        when 'width'
          @width = args.first.to_i
          self.geometry = "#{args.first.to_i}x#{@height || DEFAULT_HEIGHT}#{x_sign}#{abs_x}#{y_sign}#{abs_y}"
        when 'height'
          @height = args.first.to_i
          self.geometry = "#{@width || DEFAULT_WIDTH}x#{args.first.to_i}#{x_sign}#{abs_x}#{y_sign}#{abs_y}"
        when 'x'
          self.geometry = "#{@width || DEFAULT_WIDTH}x#{@height || DEFAULT_HEIGHT}#{args.first.to_i > 0 ? '+' : '-'}#{args.first.to_i.abs}#{y_sign}#{abs_y}"
        when 'y'
          self.geometry = "#{@width || DEFAULT_WIDTH}x#{@height || DEFAULT_HEIGHT}#{x_sign}#{abs_x}#{args.first.to_i > 0 ? '+' : '-'}#{args.first.to_i.abs}"
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
        attribute = attribute.to_s
        case attribute
        when 'width'
          geometry.split(REGEX_GEOMETRY)[0].to_i
        when 'height'
          geometry.split(REGEX_GEOMETRY)[1].to_i
        when 'x'
          sign_number(x_sign, geometry.split(REGEX_GEOMETRY)[2].to_i)
        when 'y'
          sign_number(y_sign, geometry.split(REGEX_GEOMETRY)[3].to_i)
        else
          super
        end
      end
      
      def width
        get_attribute(:width)
      end
      
      def height
        get_attribute(:height)
      end
      
      def x
        get_attribute(:x)
      end
      
      def y
        get_attribute(:y)
      end
      
      def width=(value)
        set_attribute(:width, value)
      end
      
      def height=(value)
        set_attribute(:height, value)
      end
      
      def x=(value)
        set_attribute(:x, value)
      end
      
      def y=(value)
        set_attribute(:y, value)
      end
      
      def handle_listener(listener_name, &listener)
        case listener_name.to_s.upcase
        when 'WM_DELETE_WINDOW', 'DELETE_WINDOW'
          listener_name = 'WM_DELETE_WINDOW'
          @tk.protocol(listener_name, &listener)
        when 'WM_OPEN_WINDOW', 'OPEN_WINDOW'
          @on_open_window_procs ||= []
          @on_open_window_procs << listener
        else
          super
        end
      end
      
      # Starts Tk mainloop
      def start_event_loop
        if @on_open_window_procs.to_a.any?
          ::Tk.after(100) do # ensure root window showed up first
            @on_open_window_procs.to_a.each do |on_open_window|
              ::Tk.after(0, on_open_window)
            end
          end
        end
        ::Tk.mainloop
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
      end
    end
  end
end
