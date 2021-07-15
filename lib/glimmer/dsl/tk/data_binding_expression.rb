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

require 'glimmer/dsl/expression'
require 'glimmer/data_binding/model_binding'
require 'glimmer/data_binding/tk/widget_binding'

module Glimmer
  module DSL
    module Tk
      # Responsible for wiring two-way data-binding.
      # Does so by using the output of the bind(model, property) command in the form
      # of a ModelBinding, which is then connected to an anonymous widget observer
      #
      # Depends on BindCommandHandler
      class DataBindingExpression < Expression
        def can_interpret?(parent, keyword, *args, &block)
          args.size == 1 and
            args[0].is_a?(DataBinding::ModelBinding)
        end
  
        def interpret(parent, keyword, *args, &block)
          parent.class
          model_binding = args[0]
          widget_binding_parameters = [parent, keyword]
          widget_binding = DataBinding::Tk::WidgetBinding.new(*widget_binding_parameters)
          #TODO make this options observer dependent and all similar observers in widget specific data binding handlers
          widget_binding.observe(model_binding)
          # TODO simplify this logic and put it where it belongs
          parent.add_observer(model_binding, keyword) if parent.respond_to?(:add_observer, [model_binding, keyword])
          widget_binding.call(model_binding.evaluate_property)
        end
      end
    end
  end
end
