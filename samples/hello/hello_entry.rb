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

class HelloEntry
  include Glimmer
  
  attr_accessor :default, :password, :telephone, :read_only
  
  def initialize
    self.default = 'default'
    self.password = 'password'
    self.telephone = '555-555-5555'
    self.read_only = 'Telephone area code is 555'
  end
  
  def launch
    root {
      title 'Hello, Entry!'
      minsize 230, 0
         
      label {
        grid sticky: 'ew'
        text 'default entry'
      }
      entry { |the_entry|
        grid sticky: 'ew'
        text <=> [self, :default]
      }
      
      label {
        grid sticky: 'ew'
        text 'password entry'
      }
      entry {
        grid sticky: 'ew'
        show '*'
        text <=> [self, :password]
      }

      @validated_entry_label = label {
        grid sticky: 'ew'
        text 'entry with event handlers'
      }
      entry { |the_entry|
        grid sticky: 'ew'
        text <=> [self, :telephone]

        # validate 'key' # default when on('validate') or on('invalid') is specified
        ## Validation happens on key change by default when validation listeners are specified
        ## (other accepted values: 'none', 'focus', 'focusin', 'focusout', 'key', or 'all')
        
        ## this event kicks in just after the user typed and before modifying the text variable
        on('validate') do |new_text_variable|
          telephone?(new_text_variable.value)
        end

        ## this event kicks in just after the text variable is validated and before it is modified
        on('invalid') do |validate_args|
          @validated_entry_label.text = "#{validate_args.value} is not a valid phone!"
          @validated_entry_label.foreground = 'red'
        end

        ## this event kicks in just after the text variable is validated and modified
        on('change') do |new_text_variable|
          self.read_only = "Telephone area code is #{new_text_variable.value.gsub(/[^0-9]/, '')[0...3]}"
          @validated_entry_label.text = 'entry with event handlers'
          @validated_entry_label.foreground = nil
        end
        
        ## this is similar to on('change') (which is Glimmer-specific), but more low level at the Tk level
        ## it is the equivalent of calling: the_entry.tk.textvariable.trace('write') { puts "..." }
        ## More at: https://tkdocs.com/tutorial/widgets.html#entry and https://tcl.tk/man/tcl8.6/TclCmd/trace.htm#M14
        on_textvariable('write') do
          puts "\"#{the_entry.text}\" has been written to entry!"
        end
      }

      label {
        grid sticky: 'ew'
        text 'read-only entry'
      }
      entry {
        grid sticky: 'ew'
        text <=> [self, :read_only]
        readonly true
      }
    }.open
  end
  
  def telephone?(text)
    !!text.match(/^\d{0,3}[-.\/]?\d{0,3}[-.\/]?\d{0,4}$/)
  end
end

HelloEntry.new.launch
