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
    # Custom list widget implementation
    class ListProxy < WidgetProxy
      def initialize(underscored_widget_name, parent_proxy, args)
        super('treeview', parent_proxy, args)
        @tk.show = 'tree'
      end
      
      def widget_custom_attribute_mapping
        @widget_custom_attribute_mapping ||= {
          ::Tk::Tile::Treeview => {
            'items' => {
              getter: {name: 'items', invoker: lambda { |widget, args| tk.children('').map(&:text) }},
              setter: {name: 'items=', invoker: lambda { |widget, args|
                @tk.delete @tk.children('')
                args.first.each do |child|
                  @tk.insert('', 'end', :text => child)
                end
              }},
            },
            'selection' => {
              getter: {name: 'selection', invoker: lambda { |widget, args| @tk.selection.map(&:text) }},
              setter: {name: 'selection=', invoker: lambda { |widget, args|
                selection_args = args.first.is_a?(Array) ? args.first : [args.first]
                selection_items = selection_args.map do |arg|
                  @tk.children('').detect {|item| item.text == arg}
                end
                @tk.selection_set(*selection_items)
              }},
            },
          },
        }
      end
    end
  end
end
