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

class HelloButton
  include Glimmer
  
  attr_accessor :count
  
  def initialize
    @count = 0
  end
  
  def launch
    root {
      title 'Hello, Button!'
      
      frame {
        grid row: 0, column: 0
        
        label {
          grid pady: 15
          text 'Text Button'
        }
        
        button { |b|
          text <= [self, :count, on_read: ->(value) { "Click To Increment: #{value}  " }]
          default 'active'
          focus true
          
          on('command') {
            self.count += 1
          }
        }
      }
        
      frame {
        grid row: 0, column: 1
        
        label {
          grid pady: 15
          text 'Image Button'
        }
        
        button {
          image File.expand_path('../../icons/glimmer.png', __dir__), subsample: 5
          
          on('command') {
            message_box(title: 'Image Button', message: 'Image Button Clicked!')
          }
        }
      }
      
      frame {
        grid row: 0, column: 2
        
        label {
          grid pady: 15
          text 'Text Image Buttons'
        }
        
        ['center', 'top', 'bottom', 'left', 'right'].each do |compound_option|
          button {
            image File.expand_path('../../icons/glimmer.png', __dir__), subsample: 5
            text "#{compound_option.capitalize} Image"
            compound compound_option
            
            on('command') {
              message_box(title: 'Text Image Button', message: 'Text Image Button Clicked!', detail: "(#{compound_option})")
            }
          }
        end
      }
    }.open
  end
end

HelloButton.new.launch
