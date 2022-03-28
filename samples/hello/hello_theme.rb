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

class HelloTheme
  include Glimmer
  
  def launch
    root {
      title 'Hello, Theme!'
      
      labelframe {
        text 'Theme'
        
        combobox { |cb|
          readonly true
          values ::Tk::Tile::Style.theme_names
          text 'aqua'
          
          on('<ComboboxSelected>') do
            ::Tk::Tile::Style.theme_use cb.tk.textvariable.value
          end
        }
      }
      
      labelframe {
        text 'Widgets'
        
        notebook {
          frame(text: 'One') {
            label {
              text 'label'
            }
            
            entry {
              text 'entry'
            }
            
            entry {
              text 'password'
              show '*'
            }
            
            spinbox {
              text '100'
            }
          }
        
          frame(text: 'Two') {
            button {
              text 'button'
            }
            
            checkbutton {
              text 'checkbutton'
            }
            
            radiobutton {
              text 'radiobutton'
            }
          }
        
          frame(text: 'Three') {
            scale {
              orient 'horizontal'
              length 200
              from 0.0
              to 100.0
              value 50
            }
            
            progressbar {
              orient 'horizontal'
              length 200
              mode 'determinate'
              maximum 100
              value 50
            }
            
            progressbar {
              orient 'vertical'
              length 100
              mode 'determinate'
              maximum 100
              value 50
            }
          }
        }
      }
    }.open
  end
end

HelloTheme.new.launch
