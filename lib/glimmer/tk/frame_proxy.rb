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
    # Proxy for Tk::Tile::Frame
    #
    # Follows the Proxy Design Pattern
    class FrameProxy < WidgetProxy
      attr_reader :tab_options
      
      def initialize(underscored_widget_name, parent_proxy, args)
        if parent_proxy.is_a?(NotebookProxy)
          @tab_options, args[0] = args[0].to_h.partition {|key, value| NotebookProxy::TAB_OPTIONS.include?(key.to_s)}
          @tab_options = Hash[@tab_options]
          @tab_options[:text] = @tab_options.delete(:title) if @tab_options.keys.include?(:title)
          args.delete_at(0) if args[0].to_a.empty?
        end
        super
      end
      
      private
      
      def initialize_defaults
        super
        self.padding = 15
      end
    end
  end
end
