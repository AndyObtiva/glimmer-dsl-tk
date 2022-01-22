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

require 'glimmer-dsl-tk'

include Glimmer

root {
  title 'Hello, Scrollbar!'
  width 400
  height 500
  
  notebook {
    grid sticky: 'nsew'
    
    frame(text: 'Scrollable List') {
      @list = list {
        grid sticky: 'nsew', row: 0, column: 0, row_weight: 1, column_weight: 1
        items 40.times.map {|n| "Item #{n + 1} of a very long list" }
      }
      
      @scrollbar = scrollbar {
        grid row: 0, column: 1
        # orient 'vertical' # default
      }
      @list.yscrollbar @scrollbar
    }
    
    frame(text: 'Scrollable Text') {
      @text = text {
        grid sticky: 'nsew', row: 0, column: 0, row_weight: 1, column_weight: 1
        value ("This is a random sample of text that will repeat over and over and over"*2 + "\n")*40
      }
      
      @yscrollbar = scrollbar {
        grid row: 0, column: 1
        # orient 'vertical' # default
      }
      @text.yscrollbar @yscrollbar
       
      @xscrollbar = scrollbar {
        grid row: 1, column: 0, column_span: 2, row_weight: 0
        orient 'horizontal'
      }
      @text.xscrollbar @xscrollbar
    }
  }
}.open
