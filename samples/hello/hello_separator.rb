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
  title 'Hello, Separator!'
  width 200
  height 200
  
  label {
    grid row: 0, column: 0, min_width: 100, min_height: 100, column_weight: 0, sticky: 'nsew'
    text 'Label 1'
    anchor 'center'
  }
  
  separator {
    grid row: 0, column: 1
    orient 'vertical'
  }
  
  label {
    grid row: 0, column: 2, min_width: 100, min_height: 100, sticky: 'nsew'
    text 'Label 2'
    anchor 'center'
  }
  
  separator {
    grid row: 1, column: 0, column_span: 3
    # orient 'horizontal' # default
  }
  
  label {
    grid row: 2, column: 0, min_width: 100, min_height: 100, sticky: 'nsew'
    text 'Label 3'
    anchor 'center'
  }
  
  separator {
    grid row: 2, column: 1
    orient 'vertical'
  }
  
  label {
    grid row: 2, column: 2, min_width: 100, min_height: 100, sticky: 'nsew'
    text 'Label 4'
    anchor 'center'
  }
}.open
