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

module Glimmer
  module Tk
    # Proxy for Tk Widget objects
    #
    # Follows the Proxy Design Pattern
    class WidgetProxy
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
            rescue RuntimeError, SyntaxError, NameError => e
              Glimmer::Config.logger.debug e.full_message
            end
          end
          tk_widget_class
        end
      end
      
      attr_reader :parent_proxy, :tk, :args, :keyword

      DEFAULT_INITIALIZERS = {
        'combobox' => lambda do |tk|
          tk.textvariable = ::TkVariable.new
        end,
        'label' => lambda do |tk|
          tk.textvariable = ::TkVariable.new
        end,
        'entry' => lambda do |tk|
          tk.textvariable = ::TkVariable.new
        end,
      }
            
      # Initializes a new Tk Widget
      #
      # Styles is a comma separate list of symbols representing Tk styles in lower case
      def initialize(underscored_widget_name, parent_proxy, args)
        @parent_proxy = parent_proxy
        @args = args
        @keyword = underscored_widget_name
        tk_widget_class = self.class.tk_widget_class_for(underscored_widget_name)
        @tk = tk_widget_class.new(@parent_proxy.tk, *args)
        # a common widget initializer
        @tk.grid unless @tk.is_a?(::Tk::Toplevel)
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

      def tk_widget_has_attribute_setter?(attribute)
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
      
      def tk_widget_has_attribute_getter_setter?(attribute)
        begin
          # TK Widget currently doesn't support respond_to? properly, so I have to resort to this trick for now
          @tk.send(attribute)
          true
        rescue
          false
        end
      end
      
      def has_state?(attribute)
        attribute = attribute.sub(/\?$/, '').sub(/=$/, '')
        if @tk.respond_to?(:tile_state)
          begin
            @tk.tile_instate(attribute)
            true
          rescue
            false
          end
        else
          false
        end
      end
      
      def has_attributes_attribute?(attribute)
        attribute = attribute.sub(/\?$/, '').sub(/=$/, '')
        @tk.respond_to?(:attributes) && @tk.attributes.keys.include?(attribute.to_s)
      end
      
      def has_attribute?(attribute, *args)
        (widget_custom_attribute_mapping[tk.class] and widget_custom_attribute_mapping[tk.class][attribute.to_s]) or
          tk_widget_has_attribute_setter?(attribute) or
          tk_widget_has_attribute_getter_setter?(attribute) or
          has_state?(attribute) or
          has_attributes_attribute?(attribute) or
          respond_to?(attribute_setter(attribute), args)
      end

      def set_attribute(attribute, *args)
        widget_custom_attribute = widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][attribute.to_s]
        if widget_custom_attribute
          widget_custom_attribute[:setter][:invoker].call(@tk, args)
        elsif tk_widget_has_attribute_setter?(attribute)
          unless args.size == 1 && @tk.send(attribute) == args.first
            if args.size == 1
              @tk.send(attribute_setter(attribute), *args)
            else
              @tk.send(attribute_setter(attribute), args)
            end
          end
        elsif tk_widget_has_attribute_getter_setter?(attribute)
          @tk.send(attribute, *args)
        elsif has_state?(attribute)
          attribute = attribute.sub(/=$/, '')
          if !!args.first
            @tk.tile_state(attribute)
          else
            @tk.tile_state("!#{attribute}")
          end
        elsif has_attributes_attribute?(attribute)
          attribute = attribute.sub(/=$/, '')
          @tk.attributes(attribute, args.first)
        else
          send(attribute_setter(attribute), args)
        end
      end

      def get_attribute(attribute)
        widget_custom_attribute = widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][attribute.to_s]
        if widget_custom_attribute
          widget_custom_attribute[:getter][:invoker].call(@tk, args)
        elsif tk_widget_has_attribute_getter_setter?(attribute)
          @tk.send(attribute)
        elsif has_state?(attribute)
          @tk.tile_instate(attribute.sub(/\?$/, ''))
        elsif has_attributes_attribute?(attribute)
          result = @tk.attributes[attribute.sub(/\?$/, '')]
          result = result == 1 if result.is_a?(Integer)
          result
        else
          send(attribute)
        end
      end

      def attribute_setter(attribute)
        "#{attribute}="
      end
      
      def widget_custom_attribute_mapping
        @widget_custom_attribute_mapping ||= {
          ::Tk::Tile::TButton => {
            'image' => {
              getter: {name: 'image', invoker: lambda { |widget, args| @tk.image }},
              setter: {name: 'image=', invoker: lambda { |widget, args| @tk.image = image_argument(args) }},
            },
          },
          ::Tk::Tile::TCombobox => {
            'text' => {
              getter: {name: 'text', invoker: lambda { |widget, args| @tk.textvariable&.value }},
              setter: {name: 'text=', invoker: lambda { |widget, args| @tk.textvariable&.value = args.first }},
            },
          },
          ::Tk::Tile::TLabel => {
            'text' => {
              getter: {name: 'text', invoker: lambda { |widget, args| @tk.textvariable&.value }},
              setter: {name: 'text=', invoker: lambda { |widget, args| @tk.textvariable&.value = args.first }},
            },
            'image' => {
              getter: {name: 'image', invoker: lambda { |widget, args| @tk.image }},
              setter: {name: 'image=', invoker: lambda { |widget, args| @tk.image = image_argument(args) }},
            },
          },
          ::Tk::Tile::TEntry => {
            'text' => {
              getter: {name: 'text', invoker: lambda { |widget, args| @tk.textvariable&.value }},
              setter: {name: 'text=', invoker: lambda { |widget, args| @tk.textvariable&.value = args.first unless @text_variable_edit }},
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
          ::Tk::Tile::TEntry => {
            'text' => lambda do |observer|
              tk.validate = 'key'
              tk.validatecommand { |new_tk_variable|
                @text_variable_edit = new_tk_variable.value != @tk.textvariable.value
                if @text_variable_edit
                  observer.call(new_tk_variable.value)
                  @text_variable_edit = nil
                  true
                else
                  false
                end
              }
            end,
          },
        }
      end
      
      def image_argument(args)
        if args.first.is_a?(::TkPhotoImage)
          args.first
        else
          image_args = {}
          image_args.merge!(file: args.first.to_s) if args.first.is_a?(String)
          the_image = ::TkPhotoImage.new(image_args)
          if args.last.is_a?(Hash)
            processed_image = ::TkPhotoImage.new
            processed_image.copy(the_image, args.last)
            the_image = processed_image
          end
          the_image
        end
      end
      
      def add_observer(observer, attribute)
        attribute_listener_installers = @tk.class.ancestors.map {|ancestor| widget_attribute_listener_installers[ancestor]}.compact
        widget_listener_installers = attribute_listener_installers.map{|installer| installer[attribute.to_s]}.compact if !attribute_listener_installers.empty?
        widget_listener_installers.to_a.first&.call(observer)
      end
      
      def handle_listener(listener_name, &listener)
        @tk.bind(listener_name, &listener)
      end
      
      def content(&block)
        Glimmer::DSL::Engine.add_content(self, Glimmer::DSL::Tk::WidgetExpression.new, keyword, *args, &block)
      end

      def method_missing(method, *args, &block)
        method = method.to_s
        if args.empty? && block.nil? && ((widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][method]) || has_state?(method) || has_attributes_attribute?(method))
          get_attribute(method)
        elsif method.end_with?('=') && block.nil? && ((widget_custom_attribute_mapping[tk.class] && widget_custom_attribute_mapping[tk.class][method.sub(/=$/, '')]) || has_state?(method) || has_attributes_attribute?(method))
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
