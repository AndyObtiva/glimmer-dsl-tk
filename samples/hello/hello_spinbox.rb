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

class HelloSpinbox
  class Person
    attr_accessor :donation
  end
  
  include Glimmer
  
  def initialize
    @person = Person.new
    @person.donation = 5.0 # in dollars
  end
  
  def launch
    root {
      title 'Hello, Spinbox!'
      
      label {
        text 'Please select the amount you would like to donate to the poor:'
      }
      
      frame {
        label {
          grid row: 0, column: 0
          text 'Amount:'
          font 'caption'
        }
        
        label {
          grid row: 0, column: 1
          text '$'
        }
        
        spinbox {
          grid row: 0, column: 2
          from 1.0 # minimum value
          to 150.0 # maximum value
          increment 5.0 # increment on up and down
          format '%0.2f'
          text <=> [@person, :donation]
        }
        
        label {
          grid row: 1, column: 0, columnspan: 3
          text <=> [@person, :donation, on_read: ->(value) { "Thank you for your donation of $#{"%.2f" % value.to_f}"}]
        }

      }
    }.open
  end
end

HelloSpinbox.new.launch
