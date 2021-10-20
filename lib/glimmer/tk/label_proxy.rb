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
require 'glimmer/tk/text_variable_owner'

module Glimmer
  module Tk
    # Proxy for Tk::Tile::TLabel
    #
    # Follows the Proxy Design Pattern
    class LabelProxy < WidgetProxy
      include TextVariableOwner
      
      FONTS_PREDEFINED = %w[default text fixed menu heading caption small_caption icon tooltip]
      
      def font=(value)
        if (value.is_a?(Symbol) || value.is_a?(String)) && FONTS_PREDEFINED.include?(value.to_s.downcase)
          @tk.font = "tk_#{value}_font".camelcase(:upper)
        else
          super
        end
      end
    end
  end
end
