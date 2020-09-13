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

require 'glimmer/dsl/expression'
require 'glimmer/data_binding/model_binding'
require 'glimmer/data_binding/tk/widget_binding'
require 'glimmer/data_binding/tk/list_selection_binding'

module Glimmer
  module DSL
    module Tk
      class ListSelectionDataBindingExpression < Expression
        def can_interpret?(parent, keyword, *args, &block)
          keyword == 'selection' and
            block.nil? and
            parent.is_a?(Glimmer::Tk::ListProxy) and
            args.size == 1 and
            args[0].is_a?(DataBinding::ModelBinding) and
            args[0].evaluate_options_property.is_a?(Array)
        end
  
        def interpret(parent, keyword, *args, &block)
          model_binding = args[0]
          widget_binding = DataBinding::Tk::WidgetBinding.new(parent, 'items')
          widget_binding.call(model_binding.evaluate_options_property)
          model = model_binding.base_model
          #TODO make this options observer dependent and all similar observers in widget specific data binding interpretrs
          widget_binding.observe(model, model_binding.options_property_name)
  
          list_selection_binding = DataBinding::Tk::ListSelectionBinding.new(parent)
          list_selection_binding.call(model_binding.evaluate_property)
          #TODO check if nested data binding works for list widget and other widgets that need custom data binding
          list_selection_binding.observe(model, model_binding.property_name_expression)
  
          parent.tk.bind('<TreeviewSelect>') do
            model_binding.call(list_selection_binding.evaluate_property)
          end
        end
      end
    end
  end
end
