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
    # Scrolledframe (#scrolledframe_tk attribute)
    # Nested widgets go into the child site (#tk attribute or @scrolledframe_tk.child_site)
    class ScrolledframeProxy < WidgetProxy
      attr_reader :scrolledframe_tk
      
      private
      
      def griddable_tk
        @scrolledframe_tk
      end

      def build_widget
        tk_widget_class = self.class.tk_widget_class_for(@keyword)
        @scrolledframe_tk = tk_widget_class.new(@parent_proxy.tk, *args)
        @tk = @scrolledframe_tk.child_site
      end
      
      def initialize_defaults
        options = {}
        options[:sticky] = 'nsew'
        options[:column_weight] = 1 if @parent_proxy.children.count == 1
        options[:row_weight] = 1 if @parent_proxy.children.count == 1
        grid(options)
      end
    end
  end
end
