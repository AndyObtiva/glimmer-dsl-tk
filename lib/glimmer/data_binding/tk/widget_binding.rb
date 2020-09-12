require 'glimmer/data_binding/observable'
require 'glimmer/data_binding/observer'

module Glimmer
  module DataBinding
    module Tk
      class WidgetBinding
        include Glimmer
        include Observable
        include Observer
  
        attr_reader :widget, :attribute
        def initialize(widget, attribute)
          @widget = widget
          @attribute = attribute  
        end
        
        def call(value)
          @widget.set_attribute(@attribute, value) unless evaluate_attribute == value
        end
        
        def evaluate_attribute
          @widget.get_attribute(@attribute)
        end
      end
    end
  end
end
