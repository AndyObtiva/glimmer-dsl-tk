# Copyright (c) 2020 Andy Maleh
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
    # Proxy for Tk::Tile::Notebook
    #
    # Follows the Proxy Design Pattern
    class NotebookProxy < WidgetProxy
      TAB_OPTIONS = ['state', 'sticky', 'padding', 'text', 'image', 'compound', 'underline']
    
      attr_reader :tab_proxies
    
      def initialize(*args)
        @tab_proxies = []
        super
      end
    
      def post_initialize_child(child)
        @tab_proxies << child
        @tk.add child.tk, child.tab_options
      end
    end
  end
end
