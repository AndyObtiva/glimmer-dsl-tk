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

require_relative 'drag_and_drop_event'
require "json"

module Glimmer
  module Tk
    module DraggableAndDroppable
      attr_accessor :on_drag_motion_block
      
      def handle_listener(listener_name, &listener)
        case listener_name.to_s.downcase
        when 'drag_start'
          self.on_drag_start_block = listener
        when 'drag_motion'
          self.on_drag_motion_block = listener
        when 'drop'
          self.on_drop_block = listener
        else
          super
        end
      end

      def drag_source=(value)
        @drag_source = value
        if @drag_source
          make_draggable
        else
          make_non_draggable
        end
      end

      def drop_target=(value)
        @drop_target = value
        if @drop_target
          make_droppable
        else
          make_non_droppable
        end
      end

      def on_drag_start_block=(block)
        @on_drag_start_block = block
        make_draggable
      end

      def on_drop_block=(value)
        @on_drop_block = value
        self.tk.bind("<DropEvent>", proc { |tk_event|
          drop_event = Glimmer::Tk::DragAndDropEvent.json_create(JSON.parse("{" + tk_event.detail + "}"))
          @on_drop_block.call(drop_event) if self == drop_event.target
        })
        self.tk.bind("<DropCheckEvent>", proc { |tk_event|
          drop_check_event = Glimmer::Tk::DragAndDropEvent.json_create(JSON.parse("{" + tk_event.detail + "}"))
          drop_check_event.source.event_generate("<DropAcceptedEvent>")
        })
      end

      def textvariable_defined?
        tk_widget_has_attribute_setter?(:textvariable) && !tk.textvariable.nil?
      end

      def make_draggable
        drag_event = nil
        bind("<DropAcceptedEvent>", proc { |event| drag_event.drop_accepted = true })
        bind("B1-Motion", proc { |tk_event|
          if drag_event.nil?
            tooltip = WidgetProxy.new('toplevel', root_parent_proxy, [])
            tooltip.overrideredirect(1) #create tooltip window to display dragged data
            tooltip.geometry("+#{tk_event.x_root + 10}+#{tk_event.y_root - 2}")
            drag_event = Glimmer::Tk::DragAndDropEvent.new(self, nil, tooltip, tk_event.x_root, tk_event.y_root, nil, false)
            if @drag_source
              tk_event.widget.configure(:cursor => "hand2")
              # Default data to drag is text
              drag_event.data = if textvariable_defined?
                tk.textvariable.value
              elsif has_attribute?('text')
                tk.text
              elsif has_attribute?('selection')
                selection.first
              end
              tooltip_label = WidgetProxy.new('label', tooltip, [])
              tooltip_label.text = drag_event.data
              tooltip_label.pack # TODO look into using grid instead to be consistent with the modern Tk way
            elsif !@on_drag_start_block.nil?
              @on_drag_start_block.call(drag_event)
              if tooltip.winfo_children().length == 0
                tooltip_label = WidgetProxy.new('label', tooltip, [])
                tooltip_label.text = drag_event.data
                tooltip_label.pack # TODO look into using grid instead to be consistent with the modern Tk way
              end
            end
          else
            drag_event.x_root, drag_event.y_root = tk_event.x_root, tk_event.y_root
            drag_event.drop_accepted = false
            move_over_widget = tk_event.widget.winfo_containing(tk_event.x_root, tk_event.y_root)
            drag_event.target = move_over_widget.proxy
            move_over_widget.event_generate("<DropCheckEvent>", :data => drag_event.to_json)
            if @on_drag_motion_block.nil?
              # Default motion behavior:
              # 1.Change cursor to show whether text can be dropped.
              # 2.Move tooltip with dragged data.
              if drag_event.drop_accepted
                tk_event.widget.configure(:cursor => "hand1")
              else
                tk_event.widget.configure(:cursor => "hand2")
              end
              drag_event.tooltip.geometry("+#{tk_event.x_root + 10}+#{tk_event.y_root - 2}")
            else
              @on_drag_motion_block.call(drag_event)
            end
          end
        })
        bind("ButtonRelease-1", proc { |tk_event|
          if drag_event
            drag_event.target = tk_event.widget.winfo_containing(tk_event.x_root, tk_event.y_root).proxy
            drag_event.source.configure(:cursor => "")
            drag_event.target.event_generate("<DropEvent>", :data => drag_event.to_json)
            drag_event.tooltip.destroy
            drag_event = nil
          end
        })
      end

      def make_non_draggable
        @tk.bind_remove("B1-Motion")
        @tk.bind_remove("ButtonRelease-1")
        @tk.bind_remove("<DropAcceptedEvent>")
      end

      def make_droppable
        self.on_drop_block = Proc.new do |event|
          event.target.text = event.data if event.target.has_attribute?('text')
          event.target.items += [event.data] if event.target.has_attribute?('items')
          event.target.selection += [event.data] if event.target.has_attribute?('selection')
        end
      end

      def make_non_droppable
        @tk.bind_remove('<DropEvent>')
        @tk.bind_remove('<DropCheckEvent>')
        @on_drop_block = nil
      end
    end
  end
end
