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

COLORS = [:white, :red, :yellow, :green, :blue, :magenta, :gray, :black]

Tk::Tile::Style.theme_use 'classic' if OS.mac? # this enables setting background on label just for demo purposes

root { |r|
  title 'Hello, Contextual Menu!'
  
  @label = label {
    grid row_weight: 1, column_weight: 1
    text 'Right-Click To Pop Up Contextual Menu!'
    font size: 50
    anchor 'center'
  }
  
  # Contextual Menu is bound to mouse right-click (and CTRL-click on Mac) by default
  # (Read Comment Below for Alternative)
  menu {
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
          
          on('command') do
            message_box(parent: r, title: 'Language Selection', message: "You selected the language of #{image_name.capitalize}!")
          end
        }
      end
    }
    
    menu(label: 'Country', underline: 0) {
      ['denmark', 'finland', 'france', 'germany', 'italy', 'mexico', 'netherlands', 'norway', 'usa'].each do |image_name|
        menu_item(:radiobutton, label: image_name.capitalize) {
          selection image_name == 'usa'
          image File.expand_path("images/#{image_name}.png", __dir__)
          compound 'left'
          
          on('command') do
            message_box(parent: r, title: 'Country Selection', message: "You selected the country of #{image_name.capitalize}!")
          end
        }
      end
    }
    
    menu(label: 'Format', underline: 3) {
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
        accelerator 'Control+S'
        
        on('command') do
          @label.font = {size: 25}
        end
      }
      
      menu_item(:radiobutton, label: 'Medium', underline: 0) {
        accelerator 'Control+M'
        selection true

        on('command') do
          @label.font = {size: 50}
        end
      }
      
      menu_item(:radiobutton, label: 'Large', underline: 0) {
        accelerator 'Control+L'
        
        on('command') do
          @label.font = {size: 75}
        end
      }
    }
  }
  
  # You can replace `menu {` code with `menu(bind: false) {` if you want to bind manually,
  # which can be useful if you want to show menu at a specific location based on conditional logic.
  #
  # You can also repurpose a `menu_bar` as a contextual menu by declaring `@menu = menu_bar {` and
  # binding to mouse right-click.
  #
  # Example:
  #
  # @menu = menu(bind: false) {
  #   menu(label: 'File', underline: 0) {
  #     menu_item(label: 'Exit')
  #   }
  # }
  # if OS.mac?
  #   on('2') do |event|
  #     @menu.popup(event.x_root, event.y_root)
  #   end
  #   on('Control-1') do |event|
  #     @menu.popup(event.x_root, event.y_root)
  #   end
  # else
  #   on('3') do |event|
  #     @menu.popup(event.x_root, event.y_root)
  #   end
  # end
}.open
