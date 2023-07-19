require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'treeview widget' do
    class TreeData
      attr_accessor :selection, :selection_options

      def initialize
        @selection_options = [
          'Item 1',
          'Item 2',
          { 'Tree 1' => [
            'Subitem 1',
            'Subitem 2',
            'Subtree 1' => [
              'And so on...'
            ]
          ] },
          'Item 3'
        ]
        @selection = [@selection_options.first]
      end
    end

    include Glimmer

    context 'single selection (browse selectmode)' do
      before(:each) do
        @tree_data = TreeData.new
        @root_proxy = root {
          @subject_proxy = treeview {
            show 'tree'
            selectmode 'browse'
            selection <=> [@tree_data, :selection]
          }
        }
      end

      it 'renders' do
        expect(@subject_proxy).to be_a(Glimmer::Tk::TreeviewProxy)
        expect(@subject_proxy.tk).to be_a(::Tk::Tile::Treeview)
        expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
        expect(@subject_proxy.items).to eq(@tree_data.selection_options)
        expect(@subject_proxy.selection).to eq(@tree_data.selection)
        expect(@subject_proxy.selectmode).to eq('browse')
      end

      it 'simple selections' do
        @subject_proxy.selection = ['Item 2']
        ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
        expect(@tree_data.selection).to eq(['Item 2'])

        @tree_data.selection = ['Item 1']
        expect(@subject_proxy.selection).to eq(['Item 1'])

        @tree_data.selection_options << 'Item 4'
        expect(@subject_proxy.items.last).to eq('Item 4')
      end

      it 'complex selections' do
        @subject_proxy.selection = [{ 'Tree 1' =>
                                        ['Subitem 1']
                                    }]
        ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
        expect(@tree_data.selection).to eq([{ 'Tree 1' =>
                                                ['Subitem 1']
                                            }])

        @tree_data.selection = [{ 'Tree 1' =>
                                    [{ 'Subtree 1' =>
                                         ['And so on...']
                                     }]
                                }]
        expect(@subject_proxy.selection).to eq([{ 'Tree 1' =>
                                                    [{ 'Subtree 1' =>
                                                         ['And so on...']
                                                     }]
                                                }])
      end

      describe 'next / prev' do
        it 'next item' do
          @subject_proxy.select_next
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq(['Item 2'])
        end

        it 'prev item' do
          @subject_proxy.select_prev
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq(['Item 1'])
        end

        it 'prev item when first item selected' do
          @tree_data.selection = ['Item 1']
          @subject_proxy.select_prev
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq(['Item 1'])
        end

        it 'next item when last item selected' do
          @tree_data.selection = ['Item 3']
          @subject_proxy.select_next
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq(['Item 3'])
        end

        it 'inside a tree' do
          @tree_data.selection = [{ 'Tree 1' => ['Subitem 1'] }]
          @subject_proxy.select_next
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq([{ 'Tree 1' => ['Subitem 2'] }])
        end

        it 'to the upper level' do
          @tree_data.selection = [{ 'Tree 1' => ['Subitem 1'] }]
          @subject_proxy.select_prev
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq(['Tree 1'])
        end

        it 'from the last item of the tree to the next upper level item' do
          @tree_data.selection = [{ 'Tree 1' => [{ 'Subtree 1' => ['And so on...'] }] }]
          @subject_proxy.select_next
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq(['Item 3'])
        end

        it 'from the the prev upper level item to the last item of the tree' do
          @tree_data.selection = ['Item 3']
          @subject_proxy.select_prev
          ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
          expect(@tree_data.selection).to eq([{ 'Tree 1' => [{ 'Subtree 1' => ['And so on...'] }] }])
        end
      end
    end

  end
end