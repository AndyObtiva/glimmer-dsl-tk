require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe Glimmer::Tk::WidgetProxy do
    include Glimmer

    before(:all) do
      @root = root { }
    end

    it 'destroys children when destroyed' do
      @root.content do
        @parent_widget = frame {
          @child_widget = frame { }
        }
      end
      expect(@child_widget).to receive(:destroy).and_call_original
      @parent_widget.destroy
    end

    describe '#window?' do
      it 'RootProxy' do
        expect(@root.window?).to be(true)
      end

      it 'ToplevelProxy' do
        @root.content do
          @toplevel = toplevel { }
        end
        expect(@toplevel.window?).to be(true)
      end

      it 'not window' do
        @root.content do
          @widget = frame { }
        end
        expect(@widget.window?).to be(false)
      end
    end

    describe '#closest_window' do
      it 'RootProxy' do
        expect(@root.closest_window).to eq(@root)
      end

      it 'inside RootProxy' do
        @root.content do
          @widget = frame { }
        end
        expect(@widget.closest_window).to eq(@root)
      end

      it 'ToplevelProxy' do
        @root.content do
          @toplevel = toplevel { }
        end
        expect(@toplevel.closest_window).to eq(@toplevel)
      end

      it 'inside ToplevelProxy' do
        @root.content do
          @toplevel = toplevel {
            @widget = frame { }
          }
        end
        expect(@widget.closest_window).to eq(@toplevel)
      end
    end

    describe '#raise_event' do
      it 'sends an event' do
        expect(@root.tk).to receive(:event_generate).with('<CustomEvent>', data: nil)
        @root.raise_event('CustomEvent')
      end

      it 'sends an event with a string argument' do
        expect(@root.tk).to receive(:event_generate).with('<CustomEvent>', data: 'argument')
        @root.raise_event('CustomEvent', 'argument')
      end

      it 'sends an event with a non-string argument' do
        argument = { key: 'value' }
        argument_dump = YAML.dump(argument)
        expect(@root.tk).to receive(:event_generate).with('<CustomEvent>', data: argument_dump)
        @root.raise_event('CustomEvent', argument)
      end
    end

    context 'visibility' do
      before do
        @root.content do
          @widget = frame { }
        end
      end

      it 'visible by default' do
        expect(@widget.visible?).to be(true)
        expect(@widget.hidden?).to be(false)
      end

      it 'visible = false' do
        expect(@widget.tk).to receive(:grid_remove)
        @widget.visible = false
        expect(@widget.visible?).to be(false)
        expect(@widget.hidden?).to be(true)
      end

      it 'hidden = true' do
        expect(@widget.tk).to receive(:grid_remove)
        @widget.hidden = true
        expect(@widget.visible?).to be(false)
        expect(@widget.hidden?).to be(true)
      end

      it 'hidden then visible' do
        @widget.visible = false
        expect(@widget.visible?).to be(false)
        expect(@widget.hidden?).to be(true)

        expect(@widget.tk).to receive(:grid)
        @widget.visible = true
        expect(@widget.visible?).to be(true)
        expect(@widget.hidden?).to be(false)
      end
    end

    context 'state' do
      before do
        @root.content do
          @widget = label { }
        end
      end

      it 'enabled by default' do
        expect(@widget.enabled?).to be(true)
        expect(@widget.disabled?).to be(false)
        expect(@widget.tk.state).to eq('normal')
      end

      it 'enabled = false' do
        @widget.enabled = false
        expect(@widget.enabled?).to be(false)
        expect(@widget.disabled?).to be(true)
        expect(@widget.tk.state).to eq('disabled')
      end

      it 'disabled = true' do
        @widget.disabled = true
        expect(@widget.enabled?).to be(false)
        expect(@widget.disabled?).to be(true)
        expect(@widget.tk.state).to eq('disabled')
      end

      it 'disabled then enabled' do
        @widget.enabled = false
        expect(@widget.enabled?).to be(false)
        expect(@widget.disabled?).to be(true)
        expect(@widget.tk.state).to eq('disabled')

        @widget.enabled = true
        expect(@widget.enabled?).to be(true)
        expect(@widget.disabled?).to be(false)
        expect(@widget.tk.state).to eq('normal')
      end
    end

  end
end