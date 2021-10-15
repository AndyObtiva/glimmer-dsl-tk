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

class HelloRadiobutton
  class Person
    attr_accessor :male, :female, :child, :teen, :adult, :senior
    
    def initialize
      reset!
    end
    
    def reset!
      self.male = true
      self.female = nil
      self.child = nil
      self.teen = nil
      self.adult = true
      self.senior = nil
    end
  end
  
  include Glimmer
  
  def initialize
    @person = Person.new
  end
  
  def launch
    root {
      title 'Hello, Radio!'
      background '#ececec' if OS.mac?
      
      label {
        text 'Gender:'
        font 'caption'
      }
      
      frame {
        radiobutton {
          text 'Male'
          variable <=> [@person, :male]
        }
        
        radiobutton {
          text 'Female'
          variable <=> [@person, :female]
        }
      }
      
      label {
        text 'Age Group:'
        font 'caption'
      }
      
      frame {
        radiobutton {
          text 'Child'
          variable <=> [@person, :child]
        }

        radiobutton {
          text 'Teen'
          variable <=> [@person, :teen]
        }

        radiobutton {
          text 'Adult'
          variable <=> [@person, :adult]
        }

        radiobutton {
          text 'Senior'
          variable <=> [@person, :senior]
        }
      }
      
      button {
        text 'Reset'
        
        command do
          @person.reset!
        end
      }
    }.open
  end
end

HelloRadiobutton.new.launch
