# Copyright (c) 2020 Andy Maleh
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
      
      def xscrollcommand_block=(proc)
        tk.xscrollcommand(proc)
      end
      
      def yscrollcommand_block=(proc)
        tk.yscrollcommand(proc)
      end
      
      def widget_attribute_listener_installers
        super.merge(
          ::Tk::Tile::Treeview => {
            'selection' => lambda do |observer|
              if observer.is_a?(Glimmer::DataBinding::ModelBinding)
                model = observer.model
                options_model_property = observer.property_name + '_options'
                if model.respond_to?(options_model_property)
                  @tk.delete @tk.children('')
                  model.send(options_model_property).each do |child|
                    @tk.insert('', 'end', :text => child)
                  end
                end
              end
              @tk.bind('<TreeviewSelect>') {
                observer.call(@tk.selection.first&.text)
              }
            end,
          },
        )
      end      
      
      def has_attribute?(attribute, *args)
        attribute == 'selection' || super
      end

      def set_attribute(attribute, *args)
        if attribute == 'children'
          @tk.delete @tk.children('')
          args.first.each do |child|
            @tk.insert('', 'end', :text => child)
          end          
        elsif attribute == 'selection'
          selection_args = args.first.is_a?(Array) ? args.first : [args.first]
          selection_items = selection_args.map do |arg|
            @tk.children('').detect {|item| item.text == arg}
          end
          @tk.selection_set(*selection_items)
        else
          super
        end
      end
      
      def get_attribute(attribute)
        if attribute == 'children'
          tk.children('').map(&:text)          
        elsif attribute == 'selection'
          tk.selection.map(&:text)
        else
          super
        end
      end
    end
  end
end
