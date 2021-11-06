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

require 'glimmer/tk/toplevel_proxy'

module Glimmer
  module Tk
    # Proxy for TkRoot
    #
    # Follows the Proxy Design Pattern
    class RootProxy < ToplevelProxy
      def initialize(*args, &block)
        @tk = ::TkRoot.new
        @tk.minsize = DEFAULT_WIDTH, DEFAULT_HEIGHT
        initialize_defaults
        post_add_content if block.nil?
      end

      def post_add_content
        set_attribute('iconphoto', File.expand_path('../../../icons/glimmer.png', __dir__)) if @tk.iconphoto.nil?
        super
      end
      
      def open
        start_event_loop
      end

      def content(&block)
        Glimmer::DSL::Engine.add_content(self, Glimmer::DSL::Tk::RootExpression.new, keyword, *args, &block)
      end
      
      def set_attribute(attribute, *args)
        case attribute.to_s
        when 'iconphoto'
          args[0..-1] = [image_argument(args)]
          super
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
      
      def handle_listener(listener_name, &listener)
        case listener_name.to_s.upcase
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
    end
  end
end
