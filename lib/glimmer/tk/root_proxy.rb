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
      def initialize(*args)
        @tk = ::TkRoot.new
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
      
      def set_attribute(attribute, *args)
        if attribute.to_s == 'iconphoto'
          args[0..-1] = [image_argument(args)]
          super
        else
          super
        end
      end

      # Starts Tk mainloop
      def start_event_loop
        ::Tk.mainloop
      end
    end
  end
end
