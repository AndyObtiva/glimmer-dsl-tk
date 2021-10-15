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
require 'glimmer/tk/commandable'

module Glimmer
  module Tk
    # Proxy for Tk::Tile::Radiobutton
    #
    # Follows the Proxy Design Pattern
    class RadiobuttonProxy < WidgetProxy
      include Commandable
      
      def sibling_radio_buttons
        @parent_proxy.children.select {|child| child.is_a?(RadiobuttonProxy) && child != self}
      end
      
      private
      
      def initialize_defaults
        super
        sibling_variable = sibling_radio_buttons.map(&:tk).map(&:variable).compact.first
        tk.variable = sibling_variable.nil? ? ::TkVariable.new : sibling_variable
      end
    end
  end
end
