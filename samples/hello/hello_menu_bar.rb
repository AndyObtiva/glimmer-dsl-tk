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
    # Mac-specific application menu (right next to the Apple menu)
    if OS.mac?
      menu(:application) {
        menu_item(:about, label: 'About My Application') {
          accelerator 'Command+A'
          
          on('command') do
            message_box(parent: r, title: 'About', message: 'About my application.')
          end
        }
        
        menu_item(:preferences) {
          on('command') do
            message_box(parent: r, title: 'Preferences', message: 'Preferences of my application.')
          end
        }
        
        # If not defined, application simply quits upon selecting Quit menu item
        menu_item(:quit) {
          on('command') do
            message_box(parent: r, title: 'Quit', message: 'Quitting my application...')
            exit(0)
          end
        }
      }
    end
    
    # Windows-specific system menu (to the top-left of the window frame)
    if OS.windows?
      menu(label: 'System')
    end
    
    menu(label: 'File', underline: 0) {
      menu_item(label: 'New', underline: 0) {
        accelerator OS.mac? ? 'Command+N' : 'Control+N'

        on('command') do
          message_box(parent: r, title: 'New', message: 'New file created.')
        end
      }
      
      menu_item(label: 'Open...', underline: 0) {
        accelerator OS.mac? ? 'Command+O' : 'Control+O'

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
        accelerator OS.mac? ? 'Command+X' : 'Control+X'
      }
      
      menu_item(label: 'Copy', underline: 0) {
        accelerator OS.mac? ? 'Command+C' : 'Control+C'
      }
      
      menu_item(label: 'Paste', underline: 0) {
        accelerator OS.mac? ? 'Command+V' : 'Control+V'
      }
    }
    
    menu(label: 'Options', underline: 0) {
      menu_item(:checkbutton, label: 'Enabled', underline: 0) {
        on('command') do
          @select_one_menu.children.each { |menu_item| menu_item.state = menu_item.state == 'disabled' ? 'normal' : 'disabled' }
          @select_multiple_menu.children.each { |menu_item| menu_item.state = menu_item.state == 'disabled' ? 'normal' : 'disabled' }
        end
      }
      
      @select_one_menu = menu(label: 'Select One', underline: 7) {
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
      
      @select_multiple_menu = menu(label: 'Select Multiple', underline: 7) {
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
    
    menu(label: 'Language', underline: 3) {
      ['denmark', 'finland', 'france', 'germany', 'italy', 'mexico', 'netherlands', 'norway', 'usa'].each do |image_name|
        menu_item(:radiobutton, label: image_name.capitalize) {
          selection image_name == 'usa'
          image File.expand_path("images/#{image_name}.png", __dir__)
        }
      end
    }
    
    menu(label: 'Country', underline: 3) {
      ['denmark', 'finland', 'france', 'germany', 'italy', 'mexico', 'netherlands', 'norway', 'usa'].each do |image_name|
        menu_item(:radiobutton, label: image_name.capitalize) {
          selection image_name == 'usa'
          image File.expand_path("images/#{image_name}.png", __dir__)
          compound 'left'
        }
      end
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
        accelerator OS.mac? ? 'Command+S' : 'Control+S'
        
        on('command') do
          @label.font = {size: 25}
        end
      }
      
      menu_item(:radiobutton, label: 'Medium', underline: 0) {
        accelerator OS.mac? ? 'Command+M' : 'Control+M'
        selection true

        on('command') do
          @label.font = {size: 50}
        end
      }
      
      menu_item(:radiobutton, label: 'Large', underline: 0) {
        accelerator OS.mac? ? 'Command+L' : 'Control+L'
        
        on('command') do
          @label.font = {size: 75}
        end
      }
    }
    
    # Mac-specific window menu (containing zooming/resizing menu items)
    menu(label: 'Window', underline: 0) if OS.mac?
    
    menu(label: 'Help', underline: 0) {
      if OS.mac?
        menu_item(:help) {
          on('command') do
            message_box(parent: r, title: 'Help', message: 'Help for my application.')
          end
        }
      end
      
      menu_item(label: 'Manual', underline: 0) {
        accelerator OS.mac? ? 'Command+Shift+M' : 'Control+U'

        on('command') do
          message_box(parent: r, title: 'Manual', message: 'Manual Contents')
        end
      }
      
      menu_item(label: 'Tutorial', underline: 0) {
        accelerator OS.mac? ? 'Command+Shift+T' : 'Control+T'

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
