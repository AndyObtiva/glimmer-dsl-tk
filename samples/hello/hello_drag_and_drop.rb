require "glimmer-dsl-tk"

include Glimmer

root {
  title "Hello, Drag and Drop!"
  frame {
    padding 5
    labelframe {
      text "Drag sources"
      padding 5
      lb = label {
        text "Entry"
        grid :row => 0, :column => 0
      }
      entry {
        text "Drag entry text"
        width 30
        grid :row => 0, :column => 1, :pady => 5, :sticky => "e"
        draggable
      }
      label {
        text "Label"
        grid :row => 1, :column => 0
      }
      label {
        text "Drag label text"
        width 30
        grid :row => 1, :column => 1, :pady => 10, :sticky => "e"
        draggable
      }
      label {
        text "Combobox"
        grid :row => 2, :column => 0, :padx => 14
      }
      combobox {
        text "Spain"
        values %w[USA Canada Mexico Columbia UK Australia Germany Italy Spain]
        width 27
        grid :row => 2, :column => 1, :pady => 5, :sticky => "e"
        draggable
      }
      label {
        text "Button"
        grid :row => 3, :column => 0
      }
      button {
        text "Drag it"
        grid :row => 3, :column => 1, :pady => 5, :sticky => "w"
        draggable
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
        droppable
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
        droppable
      }
      label {
        text "Combobox"
        grid :row => 2, :column => 0
      }
      combobox {
        width 27
        grid :row => 2, :column => 1, :pady => 5, :sticky => "e"
        droppable
      }
      label {
        text "Button"
        grid :row => 3, :column => 0
      }
      button {
        text "Drop here"
        grid :row => 3, :column => 1, :pady => 5, :sticky => "w"
        droppable
      }
      label {
        text "Checkbutton"
        grid :row => 4, :column => 0, :padx => 10
      }
      checkbutton {
        text "Check"
        grid :row => 4, :column => 1, :pady => 5, :sticky => "w"
        droppable
      }
    }
  }
}.open