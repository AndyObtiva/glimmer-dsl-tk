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

require 'glimmer-dsl-tk'

include Glimmer

root {
  title "Hello, Drag and Drop!"
  
  frame {
    padding 5
    
    labelframe {
      text "Drag sources"
      padding 5
      
      label {
        grid :row => 0, :column => 0
        text "Label"
      }
      label {
        grid :row => 0, :column => 1, :pady => 10, :sticky => "e"
        text "Drag label text"
        width 30
        drag_source true
      }
      
      label {
        grid :row => 1, :column => 0
        text "Entry"
      }
      entry {
        grid :row => 1, :column => 1, :pady => 5, :sticky => "e"
        text "Drag entry text"
        width 30
        
        # This is how to do `drag_source true` the manual way for use in exceptional cases
        on_drag_start do |event|
          event.data = event.source.text
          event.source.configure(:cursor => "hand2")
          TkLabel.new(event.tooltip) {
            text event.data + " "
            bg "yellow"
            bitmap "warning"
            compound "right"
          }.pack
        end
        on_drag_motion do |event|
          if event.drop_accepted?
            event.source.configure(:cursor => "hand1")
          else
            event.source.configure(:cursor => "hand2")
          end
          event.tooltip.geometry("+#{event.x_root + 10}+#{event.y_root - 4}")
        end
      }
            
      
      label {
        grid :row => 2, :column => 0
        text "Combobox"
      }
      combobox {
        grid :row => 2, :column => 1, :pady => 5, :sticky => "e"
        text "Spain"
        values %w[USA Canada Mexico Columbia UK Australia Germany Italy Spain]
        width 27
        
        on_drag_start do |event|
          event.data = event.source.text
        end
      }
      
      label {
        grid :row => 3, :column => 0
        text 'List'
      }
      list {
        grid :row => 3, :column => 1, :pady => 5, :sticky => "e"
        selectmode 'browse'
        items %w[USA Canada Mexico]
        selection 'Canada'
        height 3
        
        on_drag_start do |event|
          event.data = event.source.selection.first
        end
      }
      
      label {
        grid :row => 4, :column => 0
        text "Button"
      }
      button {
        grid :row => 4, :column => 1, :pady => 5, :sticky => "w"
        text "Drag it"
        drag_source true
      }
    }

    labelframe {
      grid :sticky => "nsew", :pady => 15
      text "Drop targets"
      padding 5
      
      label {
        grid :row => 0, :column => 0
        text "Label"
      }
      label {
        grid :row => 0, :column => 1, :pady => 10, :sticky => "e"
        width 30
        borderwidth 2
        relief "solid"
        
        on_drop do |event|
          event.target.text = event.data
        end
      }
      
      label {
        grid :row => 1, :column => 0
        text "Entry"
      }
      entry {
        grid :row => 1, :column => 1, :pady => 5, :sticky => "e"
        width 30
        
        on_drop { |event|
          event.target.text = event.data
        }
      }
      
      label {
        grid :row => 2, :column => 0
        text "Combobox"
      }
      combobox {
        grid :row => 2, :column => 1, :pady => 5, :sticky => "e"
        width 27
        
        on_drop do |event|
          event.target.text = event.data
        end
      }
      
      label {
        grid :row => 3, :column => 0
        text 'List'
      }
      list {
        grid :row => 3, :column => 1, :pady => 5, :sticky => "e"
        selectmode 'browse'
        height 3
        
        on_drop do |event|
          event.target.items += [event.data]
        end
      }
      
      label {
        grid :row => 4, :column => 0
        text "Button"
      }
      button {
        grid :row => 4, :column => 1, :pady => 5, :sticky => "w"
        text "Drop here"
        
        on_drop do |event|
          event.target.text = event.data
        end
      }
      
      label {
        grid :row => 5, :column => 0
        text "Checkbutton"
      }
      checkbutton {
        grid :row => 5, :column => 1, :pady => 5, :sticky => "w"
        text "Drop here to destroy a widget"
        
        on_drop do |event|
          event.target.text = event.data
          # execute asynchronously after 100ms to ensure all events have been processed before destruction
          ::Tk.after(100) {event.source.destroy}
        end
      }
    }
  }
}.open
