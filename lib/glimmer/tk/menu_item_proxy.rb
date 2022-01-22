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
    class MenuItemProxy < WidgetProxy
      ACCELERATOR_MODIFIER_EVENT_MAP = {
        'Command' => 'Command',
        'Cmd' => 'Command',
        'Meta' => 'Command',
        'Option' => 'Option',
        'Opt' => 'Option',
        'Alt' => 'Option',
        'Shift' => 'Shift',
        'Ctrl' => 'Control',
        'Control' => 'Control',
      }
      
      ATTRIBUTES = %w[activebackground activeforeground background bitmap columnbreak compound font foreground hidemargin indicatoron menu offvalue onvalue selectcolor selectimage state underline value]
      
      attr_reader :options
    
      def initialize(underscored_widget_name, parent_proxy, args, &block)
        @options = args.last.is_a?(Hash) ? args.last : {}
        @label = @options[:label]
        super
      end
    
      def accelerator=(value)
        @accelerator = value
        configure_menu_item_attribute(accelerator: value)
        root_parent_proxy.bind(accelerator_event) do |event|
          @command_block&.call(event)
        end
      end
      
      def accelerator
        @accelerator
      end
      
      def accelerator_event
        accelerator_parts = @accelerator.split('+')
        accelerator_parts.map do |accelerator_part|
          ACCELERATOR_MODIFIER_EVENT_MAP[accelerator_part.capitalize] ||
            (accelerator_part.size == 1 && accelerator_part.downcase) ||
            (function_key?(accelerator_part) && accelerator_part.upcase) ||
            accelerator_part
        end.join('-')
      end
      
      def function_key?(string)
        string.downcase.match(/^f\d+$/)
      end
      
      def label=(value)
        @last_label = @label
        @label = value
        configure_menu_item_attribute(label: @label)
      end
      
      def label
        @label
      end
      
      def image=(*args)
        @image = image_argument(args)
        configure_menu_item_attribute(image: @image)
      end
      
      def image
        @image
      end
      
      def compound=(value)
        @compound = value
        configure_menu_item_attribute(compound: @compound)
      end
      
      def compound
        @compound
      end
      
      def command_block=(proc)
        @command_block = proc
        configure_menu_item_attribute(command: @command_block)
      end
      
      def handle_listener(listener_name, &listener)
        case listener_name.to_s.downcase
        when 'command'
          self.command_block = listener
        else
          super
        end
      end
      
      def command?
        @args.first.nil? || @args.first == :command || @args.first.is_a?(Hash)
      end
      
      def radiobutton?
        @args.first == :radiobutton
      end
      
      def checkbutton?
        @args.first == :radiobutton
      end
      
      def separator?
        @args.first == :separator
      end
      
      def about?
        @args.first == :about
      end
      
      def preferences?
        @args.first == :preferences
      end
      
      def help?
        @args.first == :help
      end
      
      def quit?
        @args.first == :quit
      end
      
      def variable(auto_create: true)
        if @variable.nil? && auto_create
          sibling_variable = sibling_radio_menu_items.map {|mi| mi.variable(auto_create: false)}.compact.first
          @variable = sibling_variable.nil? ? ::TkVariable.new : sibling_variable
        else
          @variable
        end
        @variable
      end
      
      def selection=(value)
        if value
          self.value = variable.value = label
        elsif checkbutton?
          self.value = variable.value = ''
        end
      end
      
      def selection
        variable.value == label
      end
      
      # configures menu item attribute through parent menu
      def configure_menu_item_attribute(attribute_value_hash)
        if preferences? && attribute_value_hash[:command]
          ::Tk.ip_eval("proc ::tk::mac::ShowPreferences {} {#{::Tk.install_cmd(attribute_value_hash[:command])}}") if OS.mac?
        elsif help? && attribute_value_hash[:command]
          ::Tk.ip_eval("proc ::tk::mac::ShowHelp {} {#{::Tk.install_cmd(attribute_value_hash[:command])}}") if OS.mac?
        elsif quit? && attribute_value_hash[:command]
          ::Tk.ip_eval("proc ::tk::mac::Quit {} {#{::Tk.install_cmd(attribute_value_hash[:command])}}") if OS.mac?
        else
          if attribute_value_hash.keys.first.to_s == 'label'
            @parent_proxy.tk.entryconfigure @last_label, attribute_value_hash
            self.value = variable.value = attribute_value_hash.values.first if variable.value == @last_label
          else
            @parent_proxy.tk.entryconfigure label, attribute_value_hash
          end
        end
      end
      
      def has_attributes_attribute?(attribute)
        attribute = attribute.to_s
        attribute = attribute.sub(/\?$/, '').sub(/=$/, '')
        ATTRIBUTES.include?(attribute)
      end
      
      def set_attribute(attribute, value)
        if has_attributes_attribute?(attribute)
          configure_menu_item_attribute(attribute => value)
        else
          super
        end
      end
      
      def get_attribute(attribute)
        if has_attributes_attribute?(attribute)
          @parent_proxy.tk.entrycget label, attribute
        else
          super
        end
      end
      
      private
      
      def sibling_radio_menu_items
        @parent_proxy.children.select {|child| child.is_a?(MenuItemProxy) && radiobutton? && child != self}
      end
      
      def build_widget
        @args.prepend(:command) if @args.first.is_a?(Hash)
        @args.append({}) if !@args.last.is_a?(Hash)
        @args.last.merge!(variable: variable, value: label) if radiobutton? || checkbutton?
        case @parent_proxy
        when MenuProxy
          if @parent_proxy.application?
            if OS.mac?
              if about?
                @parent_proxy.tk.add :command, :label => label
              end
            end
          else
            @parent_proxy.tk.add(*@args) unless help?
          end
        end
      end
    end
  end
end
