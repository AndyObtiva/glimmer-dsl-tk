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
  title 'Hello, Scrollbar Frame!'
  width 400
  height 400
  
  notebook {
    grid sticky: 'nsew'
    
    frame(text: 'X/Y Scroll') {
      scrollbar_frame {
        30.times do |row|
          10.times do |column|
            button {
              grid row: row, column: column, row_weight: 0, column_weight: 0
              text "Row #{row} | Column #{column}"
            }
          end
        end
      }
    }
    
    frame(text: 'Y Scroll') {
      scrollbar_frame {
        xscrollbar false
        
        30.times do |row|
          2.times do |column|
            button {
              grid row: row, column: column, row_weight: 0, column_weight: 0
              text "Row #{row} | Column #{column}"
            }
          end
        end
      }
    }
    
    frame(text: 'X Scroll') {
      scrollbar_frame {
        yscrollbar false
        
        13.times do |row|
          10.times do |column|
            button {
              grid row: row, column: column, row_weight: 0, column_weight: 0
              text "Row #{row} | Column #{column}"
            }
          end
        end
      }
    }
  }
}.open
