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

COLORS = [:white, :red, :yellow, :green, :blue, :magenta, :gray, :black]

Tk::Tile::Style.theme_use "classic" # this enables setting background on label just for demo purposes

root { |r|
  title 'Hello, Menu Bar!'
  
  @label = label {
    grid row_weight: 1, column_weight: 1
    text 'Check Out The Menu Bar Above!'
    font size: 50
    anchor 'center'
  }
  
  menu {
    menu(label: 'File', underline: 0) {
      menu_item(label: 'New', underline: 0) {
        accelerator 'Command+N'

        on('command') do
          message_box(parent: r, title: 'New', message: 'New file created.')
        end
      }
      menu_item(label: 'Open...', underline: 0) {
        accelerator 'Command+O'

        on('command') do
          message_box(parent: r, title: 'Open', message: 'Opening File...')
        end
      }
      menu(label: 'Open Recent', underline: 5) {
        menu_item(label: 'File 1') {
          on('command') do
            message_box(parent: r, title: 'File 1', message: 'File 1 Contents')
          end
        }
        menu_item(label: 'File 2') {
          on('command') do
            message_box(parent: r, title: 'File 2', message: 'File 2 Contents')
          end
        }
      }
      menu_item(:separator)
      menu_item(label: 'Exit', underline: 1) {
        on('command') do
          exit(0)
        end
      }
    }
    menu(label: 'Edit', underline: 0) {
      menu_item(label: 'Cut', underline: 2) {
        accelerator 'Command+X'
      }
      menu_item(label: 'Copy', underline: 0) {
        accelerator 'Command+C'
      }
      menu_item(label: 'Paste', underline: 0) {
        accelerator 'Command+V'
      }
    }
    menu(label: 'Options', underline: 0) {
      menu_item(:checkbutton, label: 'Enabled', underline: 0) {
        on('command') do
          @select_one_menu.children.each { |menu_item| menu_item.state = menu_item.state == 'disabled' ? 'normal' : 'disabled' }
          @select_multiple_menu.children.each { |menu_item| menu_item.state = menu_item.state == 'disabled' ? 'normal' : 'disabled' }
        end
      }
      @select_one_menu = menu(label: 'Select One', underline: 0) {
        menu_item(:radiobutton, label: 'Option 1') {
          state 'disabled'
        }
        menu_item(:radiobutton, label: 'Option 2') {
          state 'disabled'
        }
        menu_item(:radiobutton, label: 'Option 3') {
          state 'disabled'
        }
      }
      @select_multiple_menu = menu(label: 'Select Multiple', underline: 0) {
        menu_item(:checkbutton, label: 'Option 4') {
          state 'disabled'
        }
        menu_item(:checkbutton, label: 'Option 5') {
          state 'disabled'
        }
        menu_item(:checkbutton, label: 'Option 6') {
          state 'disabled'
        }
      }
    }
    menu(label: 'Format', underline: 0) {
      menu(label: 'Background Color', underline: 0) {
        COLORS.each { |color_style|
          menu_item(:radiobutton, label: color_style.to_s.split('_').map(&:capitalize).join(' ')) {
            on('command') do
              @label.background = color_style
            end
          }
        }
      }
      menu(label: 'Foreground Color', underline: 11) {
        COLORS.each { |color_style|
          menu_item(:radiobutton, label: color_style.to_s.split('_').map(&:capitalize).join(' ')) {
            on('command') do
              @label.foreground = color_style
            end
          }
        }
      }
    }
    menu(label: 'View', underline: 0) {
      menu_item(:radiobutton, label: 'Small', underline: 0) {
        accelerator 'Command+S'
        
        on('command') do
          @label.font = {size: 25}
        end
      }
      menu_item(:radiobutton, label: 'Medium', underline: 0) {
        accelerator 'Command+M'
        selection true

        on('command') do
          @label.font = {size: 50}
        end
      }
      menu_item(:radiobutton, label: 'Large', underline: 0) {
        accelerator 'Command+L'
        
        on('command') do
          @label.font = {size: 75}
        end
      }
    }
    menu(label: 'Help', underline: 0) {
      menu_item(label: 'Manual', underline: 0) {
        accelerator 'Command+Shift+M'

        on('command') do
          message_box(parent: r, title: 'Manual', message: 'Manual Contents')
        end
      }
      menu_item(label: 'Tutorial', underline: 0) {
        accelerator 'Command+Shift+T'

        on('command') do
          message_box(parent: r, title: 'Tutorial', message: 'Tutorial Contents')
        end
      }
      menu_item(:separator)
      menu_item(label: 'Report an Issue...', underline: 0) {
        on('command') do
          message_box(parent: r, title: 'Report an Issue', message: 'Reporting an issue...')
        end
      }
    }
  }
}.open
