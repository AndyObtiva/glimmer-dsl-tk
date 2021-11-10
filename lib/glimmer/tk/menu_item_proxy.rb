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
      
      attr_reader :options
    
      def initialize(underscored_widget_name, parent_proxy, args, &block)
        @options = args.last.is_a?(Hash) ? args.last : {}
        super
      end
    
      def accelerator=(value)
        @accelerator = value
        @parent_proxy.tk.entryconfigure @options[:label], accelerator: value
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
          ACCELERATOR_MODIFIER_EVENT_MAP[accelerator_part.capitalize] || accelerator_part.downcase
        end.join('-')
      end
      
      def state=(value)
        @state = value
        @parent_proxy.tk.entryconfigure @options[:label], :state => value
      end
      
      def state
        @state
      end
      
      def command_block=(proc)
        @command_block = proc
        @parent_proxy.tk.entryconfigure @options[:label], command: @command_block
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
          variable.value = @options[:label]
          # TODO handle image case where there is no label
        elsif checkbutton?
          variable.value = '__unchecked__'
        end
      end
      
      def selection
        variable.value == @options[:label]
      end
      
      private
      
      def sibling_radio_menu_items
        @parent_proxy.children.select {|child| child.is_a?(MenuItemProxy) && radiobutton? && child != self}
      end
      
      def build_widget
        @args.prepend(:command) if @args.first.is_a?(Hash)
        @args.append({}) if !@args.last.is_a?(Hash)
        @args.last.merge!(variable: variable, value: @options[:label]) if radiobutton? || checkbutton?
        case @parent_proxy
        when MenuProxy
          @parent_proxy.tk.add(*@args)
        end
      end
    end
  end
end
