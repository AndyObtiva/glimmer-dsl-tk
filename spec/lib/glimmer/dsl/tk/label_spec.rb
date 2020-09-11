require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'label widget' do
    include Glimmer
    
    it 'renders root' do
      label_text = 'Hello, World!'
      @root_proxy = root {
        @proxy = label {
          text label_text
        }
      }
      
      expect(@proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@proxy.tk).to be_a(::Tk::Tile::Label)
      expect(@proxy.parent_proxy).to eq(@root_proxy)
      expect(@proxy.tk.text).to eq(label_text)
    end
  end
end
