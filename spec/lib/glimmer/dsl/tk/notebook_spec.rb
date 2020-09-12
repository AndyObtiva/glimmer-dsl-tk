require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'notebook widget' do
    include Glimmer
    
    it 'renders notebook with tab frames' do
      tab1_text = 'English'
      tab2_text = 'French'
      @root_proxy = root {
        @proxy = notebook {
          @frame1_proxy = frame(text: tab1_text, sticky: 'w', padding: '4', image: 'image1', compound: 'center', underline: '0')
          @frame2_proxy = frame(text: tab2_text, sticky: 'e', padding: '5', image: 'image2', compound: 'image', underline: '1')
        }
      }
      
      expect(@proxy).to be_a(Glimmer::Tk::NotebookProxy)
      expect(@proxy.tk).to be_a(::Tk::Tile::Notebook)
      
      expect(@frame1_proxy).to be_a(Glimmer::Tk::FrameProxy)
      expect(@proxy.tk.tabcget_tkstring(0, 'text')).to eq(tab1_text)
      expect(@proxy.tk.tabcget_tkstring(0, 'sticky')).to eq('w')
      expect(@proxy.tk.tabcget_tkstring(0, 'padding')).to eq('4')
      expect(@proxy.tk.tabcget_tkstring(0, 'image')).to eq('image1')
      expect(@proxy.tk.tabcget_tkstring(0, 'compound')).to eq('center')
      expect(@proxy.tk.tabcget_tkstring(0, 'underline')).to eq('0')
      
      expect(@frame2_proxy).to be_a(Glimmer::Tk::FrameProxy)
      expect(@proxy.tk.tabcget_tkstring(1, 'text')).to eq(tab2_text)
      expect(@proxy.tk.tabcget_tkstring(1, 'sticky')).to eq('e')
      expect(@proxy.tk.tabcget_tkstring(1, 'padding')).to eq('5')
      expect(@proxy.tk.tabcget_tkstring(1, 'image')).to eq('image2')
      expect(@proxy.tk.tabcget_tkstring(1, 'compound')).to eq('image')
      expect(@proxy.tk.tabcget_tkstring(1, 'underline')).to eq('1')
    end
  end
end
