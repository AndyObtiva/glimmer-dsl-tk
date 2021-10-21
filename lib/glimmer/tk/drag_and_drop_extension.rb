require "json"

module Glimmer
  module Tk
    class WidgetProxy
      attr_accessor :on_drag_motion_block

      def drag_source=(value)
        @drag_source = value
        if @drag_source
          make_draggable
        else
          make_non_draggable
        end
      end

      def on_drag_start_block=(block)
        @on_drag_start_block = block
        make_draggable
      end

      def on_drop_block=(value)
        @on_drop_block = value
        self.tk.bind("<DropEvent>", proc { |tk_event|
          drop_event = DragAndDropEvent.json_create(JSON.parse("{" + tk_event.detail + "}"))
          @on_drop_block.call(drop_event) if self.tk == drop_event.target
        })
        self.tk.bind("<DropCheckEvent>", proc { |tk_event|
          drop_check_event = DragAndDropEvent.json_create(JSON.parse("{" + tk_event.detail + "}"))
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
            tooltip = TkToplevel.new(root).overrideredirect(1) #create tooltip window to display dragged data
            tooltip.geometry("+#{tk_event.x_root + 10}+#{tk_event.y_root - 2}")
            drag_event = DragAndDropEvent.new(self.tk, nil, tooltip, tk_event.x_root, tk_event.y_root, nil, false)
            if @drag_source
              tk_event.widget.configure(:cursor => "hand2")
              # Default data to drag is text
              drag_event.data = if textvariable_defined? then tk.textvariable.value elsif has_attribute?(:text) then tk.text end
              TkLabel.new(tooltip) { text drag_event.data }.pack
            elsif !@on_drag_start_block.nil?
              @on_drag_start_block.call(drag_event)
              TkLabel.new(tooltip) { text drag_event.data }.pack if tooltip.winfo_children().length == 0
            end
          else
            drag_event.x_root, drag_event.y_root = tk_event.x_root, tk_event.y_root
            drag_event.drop_accepted = false
            move_over_widget = tk_event.widget.winfo_containing(tk_event.x_root, tk_event.y_root)
            drag_event.target = move_over_widget
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
            drag_event.target = tk_event.widget.winfo_containing(tk_event.x_root, tk_event.y_root)
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

      DragAndDropEvent = Struct.new(:source, :target, :tooltip, :x_root, :y_root, :data, :drop_accepted) do
        def as_json(*)
          klass = self.class.name
          {
            JSON.create_id => klass,
            "v" => [values[0].object_id, values[1].object_id, values[2].object_id].concat(values.drop 3),
          }
        end

        def to_json(*args)
          as_json.to_json(*args)
        end

        def self.json_create(object)
          new(*[ObjectSpace._id2ref(object["v"][0]), ObjectSpace._id2ref(object["v"][1]), ObjectSpace._id2ref(object["v"][2])].concat(object["v"].drop 3))
        end
      end
    end
  end
end