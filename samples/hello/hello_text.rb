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

class HelloText
  include Glimmer
  
  COLOR_OPTIONS = %w[black purple blue green orange yellow red white].map(&:capitalize)
  FONT_FAMILY_OPTIONS = ::TkFont.families
  FOREGROUND_PROMPT = '<foreground>'
  BACKGROUND_PROMPT = '<background>'
  FONT_FAMILY_PROMPT = '<font family>'
  FONT_SIZE_PROMPT = '<font size>'
  
  def initialize
    @foreground = FOREGROUND_PROMPT
    @background = BACKGROUND_PROMPT
    @font_family = FONT_FAMILY_PROMPT
    @font_size = FONT_SIZE_PROMPT
    @document = <<~MULTI_LINE_STRING
      According to the National Post, a heavy metal-loving high school principal in Canada will be allowed to keep her job, days after a public campaign to oust her made headlines around the globe.
      
      Parents at Eden High School in St. Catharines, Ontario launched a petition to remove principal Sharon Burns after discovering she's an IRON MAIDEN fan.
      
      The petition, titled "Eden High School Principal, Sharon Burns, Needs to Be Transferred Immediately!" read, "We are deeply disturbed that the principal assigned to the school blatantly showed Satanic symbols and her allegiance to Satanic practices on her public social media platforms where all the students can see them under @edenprincipal (not her personal account)."
      
      More than 500 people signed the petition to transfer Burns after she posted a picture of herself flashing the "devil horns" hand sign with a doll of the MAIDEN zombie mascot Eddie behind her as well as a personalized license plate reading "IRNMADEN" and a handwritten note that reads "Eddie 666" on a car's dashboard.
      
      
      The number 666 is used to represent the devil, and is featured prominently in MAIDEN's artwork by the band, whose classic third album is titled "The Number Of The Beast".
      
      The petition was later updated to state that the demand for her transfer is not because of her love for metal, but for "openly displaying her own handmade sign with the 666 clearly displayed on it".
      
      The creator of the original petition wrote: "Sharon knows full well what she did was simply inappropriate, unnecessary and not professional but has yet to publicly admit so and is willing to allow people to believe a completely different story, making very real concerns seem petty."
      
      Meanwhile, a counter-petition supporting Burns garnered over 20,000 signatures.
      
      "It is ridiculous that a couple of parents judge her role as a principal only based on an Instagram post. (About liking the band IRON MAIDEN. That's it.) Eden High School is a public school. Not a Christian school," the petition titled "We need Mrs Burns" stated. "She has made Eden a safe space for so many people. She spreads nothing but love and kindness."
      
      After the complaints were aired, the District School Board of Niagara spoke with Burns and the parents who launched the petition, and the issue is over as far as the board is concerned, Kim Sweeney, the board's chief communications officer, told the National Post. No disciplinary action or policy changes were needed.
      
      "Our belief is that taste in music is subjective and we support that both students and staff enjoy a wide variety of genres," Sweeney said.
      
      The original petition has since been removed.
    MULTI_LINE_STRING
  end
  
  attr_accessor :document, :find_text
      
  attr_accessor :foreground
  
  def foreground_options
    [FOREGROUND_PROMPT] + COLOR_OPTIONS
  end
  
  attr_accessor :background
  
  def background_options
    [BACKGROUND_PROMPT] + COLOR_OPTIONS
  end
  
  attr_accessor :font_family
  
  def font_family_options
    [FONT_FAMILY_PROMPT] + FONT_FAMILY_OPTIONS
  end
  
  attr_accessor :font_size
  
  def font_size_options
    [FONT_SIZE_PROMPT] + (9..64).to_a.map(&:to_s)
  end
  
  def find
    text_index = @text.search(/#{find_text}/i, @text.tag_ranges('sel')&.first&.last || @text.index('insert'))
    unless text_index.to_s.empty?
      @text.tag_remove('sel', '1.0', 'end')
      @text.tag_add('sel', text_index, "#{text_index} + #{find_text.size} chars")
    end
  end
  
  def launch
    @root = root {
      title 'Hello, Text!'
      width 1280
      height 800
      
      frame {
        grid row: 0, column: 0, column_span: 2
        
        column_index = -1
        
        combobox { |cb|
          grid row: 1, column: column_index += 1, column_weight: 1
          readonly true
          text <=> [self, :font_family, after_write: ->(value) { @text.toggle_selection_font_format('family', value == FONT_FAMILY_PROMPT ? 'Courier New' : value, focus: OS.mac? ? 100 : true) }]
        }
        
        combobox {
          grid row: 1, column: column_index += 1, column_weight: 1
          readonly true
          text <=> [self, :font_size, after_write: ->(value) { @text.toggle_selection_font_format('size', value == FONT_SIZE_PROMPT ? 13 : value, focus: OS.mac? ? 100 : true) }]
        }
        
        combobox {
          grid row: 1, column: column_index += 1, column_weight: 1
          readonly true
          text <=> [self, :foreground, after_write: ->(value) { @text.add_selection_format('foreground', value == FOREGROUND_PROMPT ? 'black' : value, focus: OS.mac? ? 100 : true) }]
        }
        
        combobox {
          grid row: 1, column: column_index += 1, column_weight: 1
          readonly true
          text <=> [self, :background, after_write: ->(value) { @text.add_selection_format('background', value == BACKGROUND_PROMPT ? 'white' : value, focus: OS.mac? ? 100 : true) }]
        }
        
        separator {
          grid row: 1, column: column_index += 1, column_weight: 0
          orient 'vertical'
        }
        
        @bold_button = button {
          grid row: 1, column: column_index += 1, column_weight: 0
          text 'B'
          style font: {weight: 'bold'}
          
          on('command') do
            @text.toggle_selection_font_format('weight', 'bold')
          end
        }
        
        @italic_button = button {
          grid row: 1, column: column_index += 1, column_weight: 0
          text 'I'
          style font: {slant: 'italic'}
          
          on('command') do
            @text.toggle_selection_font_format('slant', 'italic')
          end
        }
        
        @underline_button = button {
          grid row: 1, column: column_index += 1, column_weight: 0
          text 'U'
          style font: {underline: true}
          
          on('command') do
            @text.toggle_selection_font_format('underline', true)
          end
        }

        separator {
          grid row: 1, column: column_index += 1, column_weight: 0
          orient 'vertical'
        }
        
        @justify_left_button = button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/align-left.png", __dir__), subsample: 32
          
          on('command') do
            @text.add_selection_format('justify', 'left')
          end
        }
        
        @justify_center_button = button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/align-center.png", __dir__), subsample: 32
          
          on('command') do
            @text.add_selection_format('justify', 'center')
          end
        }
        
        @justify_right_button = button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/align-right.png", __dir__), subsample: 32
          
          on('command') do
            @text.add_selection_format('justify', 'right')
          end
        }
        
        separator {
          grid row: 1, column: column_index += 1, column_weight: 0
          orient 'vertical'
        }
        
        button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/picture.png", __dir__), subsample: 32
          
          on('command') do
            @text.get_open_file_to_insert_image
          end
        }
        
        button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/search.png", __dir__), subsample: 32
          
          on('command') do
            show_find_dialog
          end
        }
        
        separator {
          grid row: 1, column: column_index += 1, column_weight: 0
          orient 'vertical'
        }
        
        button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/cut.png", __dir__), subsample: 32
          
          on('command') do
            @text.text_cut
          end
        }
        
        button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/copy.png", __dir__), subsample: 32
          
          on('command') do
            @text.text_copy
          end
        }
        
        button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/paste.png", __dir__), subsample: 32
          
          on('command') do
            @text.text_paste
          end
        }
        
        separator {
          grid row: 1, column: column_index += 1, column_weight: 0
          orient 'vertical'
        }
        
        
        button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/undo.png", __dir__), subsample: 32
          
          on('command') do
            @text.edit_undo
          end
        }
        
        button {
          grid row: 1, column: column_index += 1, column_weight: 0
          image File.expand_path("images/redo.png", __dir__), subsample: 32
          
          on('command') do
            @text.edit_redo
          end
        }
      }
      
      @text = text {
        grid row: 1, column: 0, row_weight: 1
        wrap 'word'
        undo true
        value <=> [self, :document]
        
        on('InsertMarkMoved') do
          self.font_family = @text.applied_font_format_value('family')
          self.font_size = @text.applied_font_format_value('size')
          @bold_button.default = @text.applied_font_format_value('weight') == 'bold' ? 'active' : 'normal'
          @italic_button.default = @text.applied_font_format_value('slant') == 'italic' ? 'active' : 'normal'
          @underline_button.default = @text.applied_font_format_value('underline') == true ? 'active' : 'normal'
          self.background = @text.applied_format_value('background')
          self.foreground = @text.applied_format_value('foreground')
          @justify_left_button.default = @text.applied_format_value('justify') == 'left' ? 'active' : 'normal'
          @justify_center_button.default = @text.applied_format_value('justify') == 'center' ? 'active' : 'normal'
          @justify_right_button.default = @text.applied_format_value('justify') == 'right' ? 'active' : 'normal'
        end
        
        on('KeyPress') do |event|
          show_find_dialog if (event.keysym == 'f') && ((OS.mac? && event.state == 8) || (!OS.mac? && event.state == 4))
        end
      }
      
      @yscrollbar = y_scrollbar {
        grid row: 1, column: 1
      }
      @text.yscrollbar @yscrollbar
    }
    @root.open
  end
  
  def show_find_dialog
    toplevel(@root) { |tl|
      title 'Find'
      
      label {
        text 'Text:'
      }
      entry { |e|
        focus true
        text <=> [
          self,
          :find_text,
          after_write: lambda do
            text_index = @text.search(/#{find_text}/i, 'insert')
            unless text_index.to_s.empty?
              @text.tag_remove('sel', '1.0', 'end')
              @text.tag_add('sel', text_index, "#{text_index} + #{find_text.size} chars")
            end
          end
        ]
                
        on('KeyPress') do |event|
          if event.keysym == 'Return'
            find
          elsif event.keysym == 'Escape'
            tl.grab_release
            tl.destroy
          end
        end
      }
      button {
        text 'Find'
        default 'active'
        
        on('command') do
          find
        end
      }
    }
  end
end

HelloText.new.launch
