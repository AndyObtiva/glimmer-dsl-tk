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

def toplevel_content
  frame {
    label {
      text "This is a fully custom toplevel, meaning you can add any widgets here!\nYou can press the ESCAPE button on the keyboard to close."
    }
    separator
    checkbutton {
      text 'This is a checkbutton'
    }
    radiobutton {
      text 'This is a radiobutton'
    }
  }
end

root { |root_window|
  title 'Hello, Toplevel!'
  
  button {
    text 'Nested Window'
    
    on('command') do
      toplevel(root_window) {
        title 'Custom Window'
        escapable true
        x 150
        y 180
        width 500
        height 200
        minsize 500, 100
        maxsize 1000, 300
          
        toplevel_content
      }
    end
  }
  
  button {
    text 'Transparent Window'
    
    on('command') do
      toplevel(root_window) {
        title 'Transparent Window'
        escapable true
        alpha 0.85
        width 250
        height 100
        resizable false, false # not resizable horizontally or vertically
          
        frame {
          label {
            text "This is a transparent window\nYou can hit ESCAPE to close."
            anchor 'center'
          }
        }
      }
    end
  }
  
  button {
    text 'Fullscreen Window'
    
    on('command') do
      toplevel(root_window) {
        title 'Fullscreen Window'
        escapable true
        fullscreen true
          
        frame {
          label {
            text "This is a fullscreen window\nYou can hit ESCAPE to close."
            anchor 'center'
          }
        }
      }
    end
  }
  
  if OS.mac?
    # mac_class (Tk.tk_call args[3]) and mac_attribute_list (Tk.tk_call args[4]) can be chosen from this page: https://wiki.tcl-lang.org/page/MacWindowStyle
    
    button {
      text 'Mac Plain (No-Button-Modeless) Window'
      
      on('command') do
        toplevel(root_window) { |t|
          title 'Mac Plain (No-Button-Modeless) Window'
          escapable true
          Tk.tk_call("::tk::unsupported::MacWindowStyle", "style", t.tk, "plain")
          
          toplevel_content
        }
      end
    }
    
    button {
      text 'Mac Floating (Close-Button-Modeless) Window'
      
      on('command') do
        toplevel(root_window) { |t|
          title 'Mac Floating (Close-Button-Modeless) Window'
          escapable true
          Tk.tk_call("::tk::unsupported::MacWindowStyle", "style", t.tk, "floating")
          
          toplevel_content
        }
      end
    }
    
    button {
      text 'Mac Document (All-Button-Modeless) Window'
      
      on('command') do
        toplevel(root_window) { |t|
          title 'Mac Document (All-Button-Modeless) Window'
          escapable true
          Tk.tk_call("::tk::unsupported::MacWindowStyle", "style", t.tk, "document")
          
          toplevel_content
        }
      end
    }
    
    button {
      text 'Mac Utility (Close-Button-Modal) Dialog'
      
      on('command') do
        toplevel(root_window) { |t|
          title 'Mac Utility (Close-Button-Modal) Dialog'
          escapable true
          Tk.tk_call("::tk::unsupported::MacWindowStyle", "style", t.tk, "utility")
          
          toplevel_content
        }
      end
    }
    
    button {
      text 'Mac Utility with Attribute List (All-Button-Modal) Dialog'
      
      on('command') do
        toplevel(root_window) { |t|
          title 'Mac Utility with Attribute List (All-Button-Modal) Dialog'
          escapable true
          Tk.tk_call("::tk::unsupported::MacWindowStyle", "style", t.tk, "utility", "closeBox collapseBox resizable horizontalZoom verticalZoom sideTitlebar")
          
          toplevel_content
        }
      end
    }
  end
}.open
