require "glimmer-dsl-tk"
require "glimmer/tk/drag_and_drop_extension"

include Glimmer

root {
  title "Hello, Drag and Drop!"
  frame {
    padding 5
    labelframe {
      text "Drag sources"
      padding 5
      label {
        text "Entry"
        grid :row => 0, :column => 0
      }
      entry {
        text "Drag entry text"
        width 30
        grid :row => 0, :column => 1, :pady => 5, :sticky => "e"
        on_drag_start { |event|
          event.data = event.source.textvariable&.value
          event.source.configure(:cursor => "hand2")
          TkLabel.new(event.tooltip) {
            text event.data + " "
            bg "yellow"
            bitmap "warning"
            compound "right"
          }.pack
        }
        on_drag_motion { |event|
          if event.drop_accepted
            event.source.configure(:cursor => "hand1")
          else
            event.source.configure(:cursor => "hand2")
          end
          event.tooltip.geometry("+#{event.x_root + 10}+#{event.y_root - 4}")
        }
      }
      label {
        text "Label"
        grid :row => 1, :column => 0
      }
      label {
        text "Drag label text"
        width 30
        grid :row => 1, :column => 1, :pady => 10, :sticky => "e"
        drag_source true
      }
      label {
        text "Combobox"
        grid :row => 2, :column => 0
      }
      combobox {
        text "Spain"
        values %w[USA Canada Mexico Columbia UK Australia Germany Italy Spain]
        width 27
        grid :row => 2, :column => 1, :pady => 5, :sticky => "e"
        on_drag_start { |event|
          event.data = event.source.textvariable&.value
        }
      }
      label {
        text "Button"
        grid :row => 3, :column => 0
      }
      button {
        text "Drag it"
        grid :row => 3, :column => 1, :pady => 5, :sticky => "w"
        drag_source true
      }
    }

    labelframe {
      text "Drop targets"
      grid :sticky => "nsew", :pady => 15
      padding 5
      label {
        text "Entry"
        grid :row => 0, :column => 0
      }
      entry {
        width 30
        grid :row => 0, :column => 1, :pady => 5, :sticky => "e"
        on_drop { |event|
          event.target.textvariable.value = event.data
        }
      }
      label {
        text "Label"
        grid :row => 1, :column => 0
      }
      label {
        width 30
        grid :row => 1, :column => 1, :pady => 10, :sticky => "e"
        borderwidth 2
        relief "solid"
        on_drop { |event|
          event.target.textvariable.value = event.data
        }
      }
      label {
        text "Combobox"
        grid :row => 2, :column => 0
      }
      combobox {
        width 27
        grid :row => 2, :column => 1, :pady => 5, :sticky => "e"
        on_drop { |event|
          event.target.textvariable.value = event.data
        }
      }
      label {
        text "Button"
        grid :row => 3, :column => 0
      }
      button {
        text "Drop here"
        grid :row => 3, :column => 1, :pady => 5, :sticky => "w"
        on_drop { |event|
          event.target.text = event.data
        }
      }
      label {
        text "Checkbutton"
        grid :row => 4, :column => 0
      }
      checkbutton {
        text "Check"
        grid :row => 4, :column => 1, :pady => 5, :sticky => "w"
        on_drop { |event|
          event.target.text = event.data
          event.source.destroy
        }
      }
    }
  }
}.open
