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

require 'glimmer/tk/widget_proxy'

module Glimmer
  module Tk
    # Proxy for Tk::Text
    #
    # Follows the Proxy Design Pattern
    class TextProxy < WidgetProxy
      def handle_listener(listener_name, &listener)
        listener_name = listener_name.to_s.downcase
        case listener_name
        when '<<modified>>', '<modified>', 'modified'
          modified_listener = Proc.new do |*args|
            listener.call(*args)
            @tk.modified = false
          end
          bind('<Modified>', modified_listener)
        when '<<selection>>', '<selection>', 'selection'
          bind('<Selection>', listener)
        else
          super
        end
      end
    
      def text=(value)
        if value != @text
          if @text && value.start_with?(@text)
            insert('end', value[@text.size..-1])
          else
            delete('1.0', 'end')
            insert('end', value)
          end
          @text = value
        end
      end
      
      def text
        @text = get("1.0", 'end')
      end
      
      private
      
      def initialize_defaults
        super
        self.padx = 5
        self.pady = 5
      end
    end
  end
end
