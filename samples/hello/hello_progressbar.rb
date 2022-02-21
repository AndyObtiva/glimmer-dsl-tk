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

class HelloProgressbar
  include Glimmer
  
  attr_accessor :progress_value, :maximum_value, :delay_value
  
  def initialize
    self.progress_value = 0
    self.maximum_value = 100
    self.delay_value = 0.01
    
    Thread.new do
      loop do
        self.progress_value = (self.progress_value.to_i + 1) % (maximum_value.to_i + 1)
        sleep(delay_value) # yields to main thread
      end
    end
  end
  
  def launch
    root {
      text 'Hello, Progressbar!'
      
      progressbar {
        grid row: 0, column: 0, columnspan: 3
        orient 'horizontal'
        length 200
        mode 'indeterminate'
        maximum <= [self, :maximum_value]
        value <= [self, :progress_value]
      }
      
      label {
        grid row: 1, column: 0
        text 'Value'
      }
      
      label {
        grid row: 1, column: 1
        text 'Maximum'
      }
      
      label {
        grid row: 1, column: 2
        text 'Delay in Seconds'
      }
      
      spinbox {
        grid row: 2, column: 0
        from 0.0
        to 100.0
        increment 1.0
        format '%0f'
        text <=> [self, :progress_value, on_read: :to_i, on_write: :to_i]
      }
      
      spinbox {
        grid row: 2, column: 1
        from 1.0
        to 100.0
        increment 1.0
        format '%0f'
        text <=> [self, :maximum_value, on_read: :to_i, on_write: :to_i]
      }
      
      spinbox {
        grid row: 2, column: 2
        from 0.01
        to 1.0
        increment 0.1
        format '%0.2f'
        text <=> [self, :delay_value, on_write: ->(val) {[val.to_f, 1.0].min}]
      }
      
      progressbar {
        grid row: 3, column: 0, columnspan: 3
        orient 'horizontal'
        length 200
        mode 'determinate'
        maximum <= [self, :maximum_value]
        value <= [self, :progress_value]
      }
      
      progressbar {
        grid row: 4, column: 0, columnspan: 3
        orient 'vertical'
        length 200
        mode 'determinate'
        maximum <= [self, :maximum_value]
        value <= [self, :progress_value]
      }
    }.open
  end
end

HelloProgressbar.new.launch
