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

root { |w|
  title 'Hello, Built-in Dialog!'
  width 400
  height 400
  x 150
  y 150
  
  frame {
    %w[get_open_file get_multiple_open_file get_save_file choose_directory].each do |dialog|
      dialog_name = dialog.split('_').map(&:capitalize).join(' ')
      button {
        text dialog_name
        
        on('command') do
          # parent is optional.
          # It is recommended to set parent to display dialog on top of.
          #
          # title is optional (defaults to blank).
          # It is not supported by choose_directory (its title is always blank).
          result = send(dialog, parent: w, title: dialog_name)
          # Uniformly handle both a singular result (e.g. from get_open_file)
          # and an array of results (e.g. from get_multiple_open_file)
          @result_label.text = [result].flatten.join("\n")
        end
      }
    end
    
    button {
      text 'Choose Color'
      
      on('command') do
        # parent is optional.
        # It is recommended to set parent to display dialog on top of.
        #
        # title is optional (defaults to 'Colors').
        #
        # initialcolor is optional (defaults to 'white').
        # It can be a built-in color (e.g. 'AliceBlue') or hex (e.g. '#FFFF00')
        # Full list of built-in colors is at: https://tcl.tk/man/tcl8.6/TkCmd/colors.htm
        chosen_color = choose_color(parent: w, title: 'Choose Color', initialcolor: '#FFFF00')
        @result_label.text = chosen_color
      end
    }
    
    button {
      text 'Choose Font'
      
      on('command') do
        # Initial family, size, and weight are optional.
        choose_font(family: 'Courier New', size: '30', weight: 'bold') do |chosen_font|
          @result_label.text = chosen_font
        end
      end
    }
  }
  
  frame {
    grid sticky: 'nsew', padx: 15, pady: 15
    
    label {
      grid row: 0, column: 0
      text 'Result:'
    }
    
    @result_label = label {
      grid row: 0, column: 1
    }
  }
}.open
