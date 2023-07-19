require 'glimmer-dsl-tk'

class TreeData
  attr_accessor :selection, :selection_options

  def initialize
    @selection_options = [
      'Item 1',
      'Item 2',
      'Tree 1' => [
        'Subitem 1',
        'Subitem 2',
        'Subtree 1' => [
          'And so on...'
        ]
      ]
    ]
  end
end

class HelloTreeview
  include Glimmer

  def launch
    tree_data = TreeData.new

    root {
      center_within_screen
      width 600
      height 600

      title 'Hello, Treeview!'
      treeview {
        grid sticky: 'nsew', row_weight: 1, column_weight: 1
        show 'tree'
        selectmode 'browse'
        selection <=> [tree_data, :selection]
      }
    }.open
  end
end

HelloTreeview.new.launch
