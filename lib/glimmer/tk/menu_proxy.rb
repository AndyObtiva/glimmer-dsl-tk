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
    class MenuProxy < WidgetProxy
      attr_reader :options
      
      def initialize(underscored_widget_name, parent_proxy, args, &block)
        @options = args.last.is_a?(Hash) ? args.last : {}
        super
      end
      
      def post_add_content
        case @parent_proxy
        when ToplevelProxy
          if @keyword == 'menu_bar'
            @parent_proxy.tk['menu'] = @tk
          elsif @options[:bind].nil? || @options[:bind]
            if OS.mac?
              @parent_proxy.handle_listener('2') do |event|
                popup(event.x_root, event.y_root)
              end
              @parent_proxy.handle_listener('Control-1') do |event|
                popup(event.x_root, event.y_root)
              end
            else
              @parent_proxy.handle_listener('3') do |event|
                popup(event.x_root, event.y_root)
              end
            end
          end
        end
      end
      
      def label
        @options[:label]
      end
      
      def help?
        label == 'Help'
      end
      
      def window?
        label == 'Window'
      end
      
      def system?
        label == 'System'
      end
      
      def application?
        @args.first == :application
      end
      
      private
      
      def build_widget
        if application?
          if OS.mac?
            @tk = ::TkSysMenu_Apple.new(@parent_proxy.tk).tap {|tk| tk.singleton_class.include(Glimmer::Tk::Widget); tk.proxy = self}
            @parent_proxy.tk.add :cascade, :menu => @tk
          end
        else
          if @parent_proxy.parent_proxy.is_a?(ToplevelProxy) && (OS.mac? || OS.linux?) && help?
            @tk = ::TkSysMenu_Help.new(@parent_proxy.tk).tap {|tk| tk.singleton_class.include(Glimmer::Tk::Widget); tk.proxy = self}
          elsif @parent_proxy.parent_proxy.is_a?(ToplevelProxy) && OS.mac? && window?
            @tk = ::Tk::TkSysMenu_Window.new(@parent_proxy.tk).tap {|tk| tk.singleton_class.include(Glimmer::Tk::Widget); tk.proxy = self}
          # Windows system menu does not seem to work
#           elsif @parent_proxy.parent_proxy.is_a?(ToplevelProxy) && OS.windows? && system?
#             @tk = ::TkSysMenu_System.new(@parent_proxy.tk).tap {|tk| tk.singleton_class.include(Glimmer::Tk::Widget); tk.proxy = self}
          else
            @tk = ::Tk::Menu.new(@parent_proxy.tk).tap {|tk| tk.singleton_class.include(Glimmer::Tk::Widget); tk.proxy = self}
          end
          case @parent_proxy
          when MenuProxy
            @parent_proxy.tk.add(:cascade, {menu: @tk}.merge(@options))
          end
        end
      end
    end
    MenuBarProxy = MenuProxy
  end
end
