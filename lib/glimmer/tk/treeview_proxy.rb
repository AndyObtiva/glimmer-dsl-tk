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

require 'glimmer/tk/widget_proxy'

module Glimmer
  module Tk
    # Custom treeview widget implementation
    class TreeviewProxy < WidgetProxy
      def has_attribute?(attribute, *args)
        attribute == 'columns' || super
      end

      def set_attribute(attribute, *args)
        if attribute == 'columns'
          self[attribute] = args.first
        else
          super
        end
      end

      def get_attribute(attribute)
        if attribute == 'columns'
          self[attribute]
        else
          super
        end
      end

      def widget_custom_attribute_mapping
        @widget_custom_attribute_mapping ||= {
          ::Tk::Tile::Treeview => {

            'items' => {
              getter: { name: 'items', invoker: lambda { |widget, args|
                build_items_tree_down(@tk.root)
              }},
              setter: { name: 'items=', invoker: lambda { |widget, args|
                # TODO: some tk tree smart update without resetting the whole tree?
                @tk.delete(@tk.children(''))
                insert_items('', args.first)
                if expanded?
                  expand_recurse(@tk.root)
                  # elsif collapsed?
                  #   collapse_recurse(@tk.root)
                end
              }}
            },

            'selection' => {
              getter: {name: 'selection', invoker: lambda { |widget, args|
                build_items_tree_up(@tk.selection)
              }},
              setter: {name: 'selection=', invoker: lambda { |widget, args|
                if args.first
                  @tk.selection_set(find_tk_elements_for_items(@tk.root, args.first))
                else
                  @tk.selection_set([])
                end
              }},
            },

            'expanded' => {
              getter: {name: 'expanded', invoker: lambda { |widget, args|
                expanded?
              }},
              setter: {name: 'expanded=', invoker: lambda { |widget, args|
                @expanded = !!args.first
                expand_recurse(@tk.root) if expanded?
              }},
            },

            # 'collapsed' => {
            #   getter: {name: 'collapsed', invoker: lambda { |widget, args|
            #     collapsed?
            #   }},
            #   setter: {name: 'collapsed=', invoker: lambda { |widget, args|
            #     # puts "collapsed set #{args.pretty_inspect}"
            #     @collapsed = !!args.first
            #     collapse_recurse(@tk.root) if collapsed?
            #   }},
            # }

          },
        }
      end

      def select_next
        # TODO: better exception?
        raise "Works only for single item selection mode" unless selectmode == 'browse'

        sel = tk.selection
        if (ch = tk.children(sel)).any?
          tk.selection_set(ch.first)
          true
        elsif (nxt = tk.next_item(sel))
          tk.selection_set(nxt)
          true
        else
          par = tk.parent_item(sel)
          while par && !par.is_a?(::Tk::Tile::Treeview::Root) do
            if (nxt = tk.next_item(par))
              tk.selection_set(nxt)
              return true
            end
            par = tk.parent_item(par)
          end
          false
        end
      end

      def select_prev
        # TODO: named exception?
        raise "Works only for single item selection mode" unless selectmode == 'browse'

        sel = tk.selection.first
        if (prv = tk.prev_item(sel))
          while (ch = tk.children(prv)).any?
            prv = ch.last
          end
          tk.selection_set(prv)
          true
        elsif (par = tk.parent_item(sel)) && !par.is_a?(::Tk::Tile::Treeview::Root)
          tk.selection_set(par)
          true
        else
          false
        end
      end

      private

      def expanded?
        instance_variable_defined?(:@expanded) ? @expanded : false
      end

      def expand_recurse(tk_root)
        tk_root.open
        tk_root.children.each { |tk_child| expand_recurse(tk_child) }
      end

      # def collapsed?
      #   !expanded? && (instance_variable_defined?(:@collapsed) ? @collapsed : false)
      # end
      #
      # def collapse_recurse(tk_root)
      #   tk_root.close
      #   tk_root.children.each { |tk_child| collapse_recurse(tk_child) }
      # end

      def insert_items(root_id, items)
        items.each do |item|
          if item.is_a?(Hash)
            sub_root_id = if root_id == ''
                            "i_#{item.keys.first}"
                          else
                            "i_#{root_id}_#{item.keys.first}"
                          end
            @tk.insert(root_id, 'end', id: sub_root_id.to_sym, text: item.keys.first)
            insert_items(sub_root_id, item.values.first)

          else
            @tk.insert(root_id, 'end', text: item)
          end
        end
      end

      def build_items_tree_down(tk_root)
        values = []

        tk_root.children.each do |tk_node|
          if tk_node.children.any?
            values.push({ tk_node.text => build_items_tree_down(tk_node) })
          else
            values.push(tk_node.text)
          end
        end

        values
      end

      def build_items_tree_up(tk_leaves)
        items_tree = []

        tk_leaves.each do |tk_leaf|
          leaf_items = []

          tk_node = tk_leaf
          until tk_node.is_a?(::Tk::Tile::Treeview::Root) do
            leaf_items.unshift tk_node.text
            tk_node = tk_node.parent_item
          end

          tree = items_tree
          leaf_items[0...-1].each do |branch_key|
            if (sub_tree = tree.find { |item| item.is_a?(Hash) && item.keys.first == branch_key })
            else
              tree.delete(branch_key) if tree.include?(branch_key)
              tree.push(sub_tree = { branch_key => []})
            end
            tree = sub_tree[branch_key]
          end

          if tree.find { |item| item.is_a?(Hash) && item.keys.first == leaf_items.last }
          elsif tree.include?(leaf_items.last)
          else
            tree.push(leaf_items.last)
          end
        end

        items_tree
      end

      def find_tk_elements_for_items(tk_root, items_tree)
        found_tk_elements = []

        items_tree.each do |item|
          if item.is_a?(Hash)
            tk_node = tk_root.children.find { |child| child.text == item.keys.first }
            if tk_node
              found_tk_elements += find_tk_elements_for_items(tk_node, item.values.first)
            end

          else
            tk_node = tk_root.children.find { |child| child.text == item }
            found_tk_elements << tk_node if tk_node
          end
        end

        found_tk_elements
      end

    end
  end
end
