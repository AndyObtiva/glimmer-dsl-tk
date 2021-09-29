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

require "glimmer/dsl/static_expression"
require "glimmer/data_binding/model_binding"

module Glimmer
  module DSL
    module Tk

      # DragAndDropExpression supports drag and drop of text attributes and textvariable values.
      # Just add 'draggable' and 'droppable' keywords to source and target widgets and drag with right-mouse button.

      module Draggable
        def self.extended(widget_proxy)
          widget_proxy.make_draggable
        end

        def make_draggable
          bind("ButtonPress-3", method(:on_drag_start))
          bind("B3-Motion", method(:on_drag_motion))
          bind("ButtonRelease-3", method(:on_drop))
          #add hint attribute to draggable tk widget
          class << self.tk
            attr_accessor :hint
          end
        end

        def on_drag_start(event)
          event.widget.configure(:cursor => "hand2")
          #create hint window to display dragged text
          event.widget.hint = TkToplevel.new(root).overrideredirect(1)
          event.widget.hint.geometry("+#{event.x_root + 4}+#{event.y_root - 2}")
          data = self.text
          TkLabel.new(event.widget.hint) { text data }.pack
        end

        def on_drag_motion(event)
          #change cursor to show whether text can be dropped
          current_widget = event.widget.winfo_containing(event.x_root, event.y_root)
          if is_droppable?(current_widget)
            event.widget.configure(:cursor => "hand1")
          else
            event.widget.configure(:cursor => "hand2")
          end
          # move hint
          event.widget.hint.geometry("+#{event.x_root + 5}+#{event.y_root - 2}")
        end

        def on_drop(event)
          target = event.widget.winfo_containing(event.x_root, event.y_root)
          if is_droppable?(target)
            if textvariable_defined?(target)
              target.textvariable.value = self.text
            elsif supports_text?(target)
              target.text = self.text
            end
          end
          event.widget.configure(:cursor => "")
          event.widget.hint.destroy
        end

        def is_droppable?(tk_widget)
          tk_widget.respond_to? :droppable
        end

        def supports_text?(tk_widget)
          tk_widget.glimmer_proxy.tk_widget_has_attribute_setter?(:text)
        end

        def textvariable_defined?(tk_widget)
          tk_widget.glimmer_proxy.tk_widget_has_attribute_setter?(:textvariable) && !tk_widget.textvariable.nil?
        end
      end

      module Droppable
        def self.extended(widget_proxy)
          class << widget_proxy.tk
            attr_reader :droppable
            attr_accessor :glimmer_proxy
          end
          widget_proxy.tk.glimmer_proxy = widget_proxy
        end
      end

      class DragAndDropExpression < StaticExpression
        def can_interpret?(parent, keyword, *args, &block)
          (keyword == "draggable" || keyword == "droppable") && args.size == 0
        end

        def interpret(parent, keyword, *args, &block)
          case keyword
          when "draggable"
            parent.extend(Draggable)
          when "droppable"
            parent.extend(Droppable)
          end
        end
      end
    end
  end
end
