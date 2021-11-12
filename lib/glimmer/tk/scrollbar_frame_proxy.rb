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
    class ScrollbarFrameProxy < WidgetProxy
      attr_reader :original_parent_proxy, :container_frame_proxy, :canvas_proxy, :yscrollbar_proxy, :xscrollbar_proxy
      
      def set_attribute(attribute, *args)
        container_frame_proxy.set_attribute(attribute, *args)
      end
      
      private
      
      def griddable_tk
        @container_frame_proxy.tk
      end

      def index_in_parent
        @original_parent_proxy&.children&.index(@container_frame_proxy)
      end

      def build_widget
        @original_parent_proxy = @parent_proxy
        @container_frame_proxy = WidgetProxy.new('frame', @parent_proxy, @args)
        @parent_proxy = @canvas_proxy = WidgetProxy.new('canvas', @container_frame_proxy, [])
        @canvas_proxy.grid(row: 0, column: 0, row_weight: 1, column_weight: 1)
        @yscrollbar_proxy = WidgetProxy.new('scrollbar', @container_frame_proxy, [])
        @yscrollbar_proxy.orient = 'vertical'
        @yscrollbar_proxy.grid(row: 0, column: 1)
        @yscrollbar_proxy.command {|*args| @canvas_proxy.tk.yview(*args)}
        @xscrollbar_proxy = WidgetProxy.new('scrollbar', @container_frame_proxy, [])
        @xscrollbar_proxy.orient = 'horizontal'
        @xscrollbar_proxy.grid(row: 1, column: 0, column_span: 2, row_weight: 0)
        @xscrollbar_proxy.command {|*args| @canvas_proxy.tk.xview(*args)}
        tk_widget_class = self.class.tk_widget_class_for('frame')
        @tk = tk_widget_class.new(@canvas_proxy.tk, *args)
        @tk.bind('Configure') {
          @canvas_proxy.tk.scrollregion(@canvas_proxy.tk.bbox("all"))
        }
        TkcWindow.new( @canvas_proxy.tk, 0, 0, :anchor => "nw", :window => @tk)
        @canvas_proxy.tk.yscrollcommand {|*args| @yscrollbar_proxy.tk.set(*args)}
        @canvas_proxy.tk.xscrollcommand {|*args| @xscrollbar_proxy.tk.set(*args)}
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
