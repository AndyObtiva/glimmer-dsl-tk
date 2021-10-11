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

class HelloFrame
  include Glimmer
  
  def launch
    root {
      title 'Hello, Frame!'
      
      frame { # frame simply contains widgets for visual organization via a layout
        relief 'sunken'
        
        label {
          grid row: 0, column: 0, columnspan: 4, padx: 5, pady: 5
          text 'Enter Your Full Name'
          font 'caption'
          anchor 'center'
        }

        label {
          grid row: 1, column: 0, padx: 5
          text "First Name:"
        }
        
        entry {
          grid row: 1, column: 1, padx: 5
        }
        
        label {
          grid row: 2, column: 0, padx: 5
          text "Last Name:"
        }
        
        entry {
          grid row: 2, column: 1, padx: 5
        }
      }
      
      frame { # an empty frame can specify width and height
        grid padx: 7, pady: 7
        width 200
        height 100
        borderwidth 3
        relief 'sunken'
      }
    }.open
  end
end

HelloFrame.new.launch
