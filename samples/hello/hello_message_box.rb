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

root { |r|
  title 'Hello, Message Box!'
  
  frame {
    grid sticky: 'nsew', padx: 15, pady: 15
    
    button {
      text 'Please Click To Win a Surprise'
      
      command {
        # specifying parent ensures dialog shows up centered on top of window (instead of centered in display monitor)
        @result_label.text = message_box(parent: r, title: 'Surprise', message: "Congratulations!\n\nYou won $1,000,000!") # type: 'ok' by default
      }
    }
    
    button {
      text 'Download Software Update'
      
      command {
        @result_label.text = message_box(type: 'okcancel', title: 'Software Update', message: "We will begin to download software update.")
      }
    }
    
    button {
      text 'Format Hard Drive'
      
      command {
        @result_label.text = message_box(type: 'yesno', icon: 'question', title: 'Format', message: "Would you like to format your hard drive?")
      }
    }
    
    button {
      text 'Submit Application'
      
      command {
        @result_label.text = message_box(type: 'yesnocancel', icon: 'question', title: 'Application', message: "Would you like to review application before submitting?")
      }
    }
    
    button {
      text 'Play Video'
      
      command {
        @result_label.text = message_box(type: 'retrycancel', icon: 'error', title: 'Video Replay', message: "Video has failed to play. Would you like to retry?")
      }
    }
    
    button {
      text 'Installation Completed'
      
      command {
        @result_label.text = message_box(type: 'abortretryignore', icon: 'warning', default: 'ignore', title: 'Failed To Install Extra Utilities', message: "Installation is complete, but extra utilities have failed to install. Would you like to retry installing extra utilities?", detail: 'Encountered network error in downloading extra utilities, resulting in failure to install them')
      }
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
