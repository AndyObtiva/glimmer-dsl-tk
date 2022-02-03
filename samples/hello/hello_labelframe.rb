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
  title 'Hello, Labelframe!'
  
  labelframe {
    grid column: 0, row: 0, padx: 10, pady: 10
    text 'Name:'
    padding 10
    
    label {
      grid column: 0, row: 0, sticky: 'w'
      text 'First Name:'
    }
    entry {
      grid column: 1, row: 0
      width 15
    }
    
    label {
      grid column: 0, row: 1, sticky: 'w'
      text 'Last Name:'
    }
    entry {
      grid column: 1, row: 1
      width 15
    }
  }
  
  labelframe {
    grid column: 0, row: 1, padx: 10, pady: 10
    text 'Address:'
    padding 10
    
    label {
      grid column: 0, row: 0, sticky: 'w'
      text 'Street:'
    }
    entry {
      grid column: 1, row: 0
      width 15
    }
    
    label {
      grid column: 0, row: 1, sticky: 'w'
      text 'City:'
    }
    entry {
      grid column: 1, row: 1
      width 15
    }
    
    label {
      grid column: 0, row: 2, sticky: 'w'
      text 'State:'
    }
    entry {
      grid column: 1, row: 2
      width 15
    }
    
    label {
      grid column: 0, row: 3, sticky: 'w'
      text 'Zip:'
    }
    entry {
      grid column: 1, row: 3
      width 15
    }
  }
  
  labelframe {
    grid column: 1, row: 0, rowspan: 2, padx: 10, pady: 10
    text 'Medical Info:'
    padding 10
    
    label {
      grid column: 0, row: 0, sticky: 'w'
      text 'Family Doctor:'
    }
    entry {
      grid column: 1, row: 0
      width 15
    }
    
    label {
      grid column: 0, row: 1, sticky: 'w'
      text 'Chronic Conditions:'
    }
    entry {
      grid column: 1, row: 1
      width 15
    }
    
    label {
      grid column: 0, row: 2, sticky: 'w'
      text 'Past Surgeries:'
    }
    entry {
      grid column: 1, row: 2
      width 15
    }
    
    label {
      grid column: 0, row: 3, sticky: 'w'
      text 'Health Insurance Info:'
    }
    entry {
      grid column: 1, row: 3
      width 15
    }
    
    label {
      grid column: 0, row: 4, sticky: 'w'
      text 'Dental Insurance Info:'
    }
    entry {
      grid column: 1, row: 4
      width 15
    }
    
    label {
      grid column: 0, row: 5, sticky: 'w'
      text 'Diet:'
    }
    entry {
      grid column: 1, row: 5
      width 15
    }
    
    label {
      grid column: 0, row: 6, sticky: 'w'
      text 'Exercise:'
    }
    entry {
      grid column: 1, row: 6
      width 15
    }
  }
}.open
