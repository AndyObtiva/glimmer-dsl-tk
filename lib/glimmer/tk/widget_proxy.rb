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

module Glimmer
  module Tk
    # Proxy for Tk Widget objects
    #
    # Follows the Proxy Design Pattern
    class WidgetProxy
      attr_reader :parent_proxy, :tk, :args

      DEFAULT_INITIALIZERS = {
        'combobox' => lambda do |tk|
          tk.textvariable = ::TkVariable.new          
        end,
      }
      
      class << self
        def create(keyword, parent, args)
          widget_proxy_class(keyword).new(keyword, parent, args)
        end
        
        def widget_proxy_class(keyword)
          begin
            class_name = "#{keyword.camelcase(:upper)}Proxy".to_sym
            Glimmer::Tk.const_get(class_name)
          rescue
            Glimmer::Tk::WidgetProxy
          end        
        end
        
        # This supports widgets in and out of basic Tk
        def tk_widget_class_for(underscored_widget_name)
          tk_widget_class_basename = underscored_widget_name.camelcase(:upper)
          potential_tk_widget_class_names = [
            "::Tk::Tile::#{tk_widget_class_basename}", 
            "::Tk::#{tk_widget_class_basename}", 
            "::Tk#{tk_widget_class_basename}", 
            "::Glimmer::Tk::#{tk_widget_class_basename}Proxy", 
          ]
          tk_widget_class = nil
          potential_tk_widget_class_names.each do |tk_widget_name|
            begin
              tk_widget_class = eval(tk_widget_name)
              break
            rescue SyntaxError, NameError => e
              Glimmer::Config.logger.debug e.full_message
            rescue => e
              Glimmer::Config.logger.debug e.full_message
            end            
          end
          tk_widget_class
        end
      end      
      
      # Initializes a new Tk Widget
      #
      # Styles is a comma separate list of symbols representing Tk styles in lower case
      def initialize(underscored_widget_name, parent_proxy, args)
        @parent_proxy = parent_proxy
        @args = args
        tk_widget_class = self.class.tk_widget_class_for(underscored_widget_name)
        @tk = tk_widget_class.new(@parent_proxy.tk, *args)
        begin
          # a common widget initializer
          @tk.grid
        rescue => e
          # catching error just in case a widget doesn't support it
          Glimmer::Config.logger.debug e.full_message
        end
        DEFAULT_INITIALIZERS[underscored_widget_name]&.call(@tk)        
        @parent_proxy.post_initialize_child(self)
      end
      
      # Subclasses may override to perform post initialization work on an added child
      def post_initialize_child(child)
        # No Op by default
      end

      # Subclasses may override to perform post add_content work
      def post_add_content
        # No Op by default
      end

      def self.widget_exists?(underscored_widget_name)
        !!tk_widget_class_for(underscored_widget_name)
      end

      def tk_widget_has_attribute?(attribute)
        result = nil
        begin     
          # TK Widget currently doesn't support respond_to? properly, so I have to resort to this trick for now   
          @tk.send(attribute_setter(attribute), @tk.send(attribute))
          result = true
        rescue => e
          result = false
        end
        result      
      end
      
      def has_attribute?(attribute, *args)
        (widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][attribute.to_s]) || 
          tk_widget_has_attribute?(attribute) || 
          respond_to?(attribute_setter(attribute), args)
      end

      def set_attribute(attribute, *args)
        widget_custom_attribute = widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][attribute.to_s]
        if widget_custom_attribute
          widget_custom_attribute[:setter][:invoker].call(@tk, args)
        elsif tk_widget_has_attribute?(attribute)
          @tk.send(attribute_setter(attribute), *args) unless @tk.send(attribute) == args.first
        else
          send(attribute_setter(attribute), args)
        end
      end

      def get_attribute(attribute)
        widget_custom_attribute = widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][attribute.to_s]
        if widget_custom_attribute
          widget_custom_attribute[:getter][:invoker].call(@tk, args)
        else
          @tk.send(attribute)
        end
      end

      def attribute_setter(attribute)
        "#{attribute}="
      end
      
      def widget_custom_attribute_mapping
        @widget_custom_attribute_mapping ||= {
          ::Tk::Tile::TCombobox => {
            'text' => {
              getter: {name: 'text', invoker: lambda { |widget, args| @tk.textvariable&.value }},
              setter: {name: 'text=', invoker: lambda { |widget, args| @tk.textvariable&.value = args.first }},
            },
          },
        }
      end
      
      def widget_attribute_listener_installers
        @tk_widget_attribute_listener_installers ||= {
          ::Tk::Tile::TCombobox => {
            'text' => lambda do |observer|
              if observer.is_a?(Glimmer::DataBinding::ModelBinding)
                model = observer.model
                options_model_property = observer.property_name + '_options'
                @tk.values = model.send(options_model_property) if model.respond_to?(options_model_property)
              end
              @tk.bind('<ComboboxSelected>') {
                observer.call(@tk.textvariable.value)
              }
            end,
          },
        }
      end
      
      def add_observer(observer, attribute)
        attribute_listener_installers = @tk.class.ancestors.map {|ancestor| widget_attribute_listener_installers[ancestor]}.compact
        widget_listener_installers = attribute_listener_installers.map{|installer| installer[attribute.to_s]}.compact if !attribute_listener_installers.empty?
        widget_listener_installers.to_a.first&.call(observer)
      end      

      def content(&block)
        Glimmer::DSL::Engine.add_content(self, Glimmer::DSL::Tk::WidgetExpression.new, &block)
      end

      def method_missing(method, *args, &block)
        method = method.to_s
        if args.empty? && block.nil?
          get_attribute(method)
        elsif widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][method.sub(/=$/, '')] && method.end_with?('=') && block.nil?
          set_attribute(method.sub(/=$/, ''), *args)
        else
          tk.send(method, *args, &block)
        end
      rescue => e
        Glimmer::Config.logger.debug {"Neither WidgetProxy nor #{tk.class.name} can handle the method ##{method}"}
        super(method.to_sym, *args, &block)
      end
      
      def respond_to?(method, *args, &block)
        super || 
          tk.respond_to?(method, *args, &block)
      end
    end
  end
end
