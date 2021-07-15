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

require_relative 'hello_computed/contact'

class HelloComputed
  include Glimmer

  def initialize
    @contact = Contact.new(
      first_name: 'Barry',
      last_name: 'McKibbin',
      year_of_birth: 1985
    )
  end

  def launch
    root {
      title 'Hello, Computed!'
      
      frame {
        grid column: 0, row: 0, padx: 5, pady: 5
        
        label {
          grid column: 0, row: 0, sticky: 'w'
          text 'First Name: '
        }
        entry {
          grid column: 1, row: 0
          width 15
          text bind(@contact, :first_name)
        }
        
        label {
          grid column: 0, row: 1, sticky: 'w'
          text 'Last Name: '
        }
        entry {
          grid column: 1, row: 1
          width 15
          text bind(@contact, :last_name)
        }
        
        label {
          grid column: 0, row: 2, sticky: 'w'
          text 'Year of Birth: '
        }
        entry {
          grid column: 1, row: 2
          width 15
          text bind(@contact, :year_of_birth)
        }
        
        label {
          grid column: 0, row: 3, sticky: 'w'
          text 'Name: '
        }
        label {
          grid column: 1, row: 3, sticky: 'w'
          text bind(@contact, :name, computed_by: [:first_name, :last_name])
        }
        
        label {
          grid column: 0, row: 4, sticky: 'w'
          text 'Age: '
        }
        label {
          grid column: 1, row: 4, sticky: 'w'
          text bind(@contact, :age, on_write: :to_i, computed_by: [:year_of_birth])
        }
      }
    }.open
  end
end

HelloComputed.new.launch
