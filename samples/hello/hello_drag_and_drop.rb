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
        text "Drop here to destroy a widget\n(except button)"
        grid :row => 4, :column => 1, :pady => 5, :sticky => "w"
        on_drop { |event|
          event.target.text = event.data
          event.source.destroy unless event.source.is_a? Tk::Button
        }
      }
    }
  }
}.open
