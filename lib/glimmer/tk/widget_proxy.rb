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
        'label' => lambda do |widget|
          widget.grid
        end,
        'frame' => lambda do |widget|
          widget.grid
        end,
        'notebook' => lambda do |widget|
          widget.grid
        end,
        'combobox' => lambda do |widget|
          widget.grid
        end,
        'button' => lambda do |widget|
          widget.grid
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
      end      
      
      # Initializes a new Tk Widget
      #
      # Styles is a comma separate list of symbols representing Tk styles in lower case
      def initialize(underscored_widget_name, parent_proxy, args)
        @parent_proxy = parent_proxy
        @args = args
        tk_widget_class = self.class.tk_widget_class_for(underscored_widget_name)
        @tk = tk_widget_class.new(@parent_proxy.tk, *args)
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

      # This supports widgets in and out of basic Tk
      def self.tk_widget_class_for(underscored_widget_name)
        tk_widget_name = "::Tk::Tile::#{underscored_widget_name.camelcase(:upper)}"        
        tk_widget_class = eval(tk_widget_name)
        tk_widget_class
      rescue SyntaxError, NameError => e
        puts e.full_message
        nil
      rescue => e
        puts e.full_message
        nil      
      end
      
      def tk_widget_has_attribute?(attribute_name)
        result = nil
        begin     
          # TK Widget currently doesn't support respond_to? properly, so I have to resort to this trick for now   
          @tk.send(attribute_setter(attribute_name), @tk.send(attribute_name))
          result = true
        rescue => e
          result = false
        end
        result      
      end
      
      def has_attribute?(attribute_name, *args)
        tk_widget_has_attribute?(attribute_name) || respond_to?(attribute_setter(attribute_name), args)
      end

      def set_attribute(attribute_name, *args)
        if tk_widget_has_attribute?(attribute_name)
          @tk.send(attribute_setter(attribute_name), *args) unless @tk.send(attribute_name) == args.first
        else
          send(attribute_setter(attribute_name), args)
        end
      end

      def get_attribute(attribute_name)
        @tk.send(attribute_name)
      end      

      def attribute_setter(attribute_name)
        "#{attribute_name}="
      end

      def content(&block)
        Glimmer::DSL::Engine.add_content(self, Glimmer::DSL::Tk::WidgetExpression.new, &block)
      end

      def method_missing(method, *args, &block)
        tk.send(method, *args, &block)
      rescue => e
        Glimmer::Config.logger.debug {"Neither WidgetProxy nor #{tk.class.name} can handle the method ##{method}"}
        super
      end
      
      def respond_to?(method, *args, &block)
        super || 
          tk.respond_to?(method, *args, &block)
      end
    end
  end
end
