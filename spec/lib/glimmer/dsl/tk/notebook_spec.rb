require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'notebook widget' do
    include Glimmer
    
    it 'renders notebook with tab frames' do
      tab1_text = 'English'
      tab2_text = 'French'
      @root_proxy = root {
        @subject_proxy = notebook {
          @frame1_proxy = frame(text: tab1_text, sticky: 'w', padding: '4', image: 'image1', compound: 'center', underline: '0')
          @frame2_proxy = frame(text: tab2_text, sticky: 'e', padding: '5', image: 'image2', compound: 'image', underline: '1')
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::NotebookProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::Notebook)
      
      expect(@frame1_proxy).to be_a(Glimmer::Tk::FrameProxy)
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'text')).to eq(tab1_text)
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'sticky')).to eq('w')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'padding')).to eq('4')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'image')).to eq('image1')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'compound')).to eq('center')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'underline')).to eq('0')
      
      expect(@frame2_proxy).to be_a(Glimmer::Tk::FrameProxy)
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'text')).to eq(tab2_text)
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'sticky')).to eq('e')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'padding')).to eq('5')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'image')).to eq('image2')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'compound')).to eq('image')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'underline')).to eq('1')
    end
    
    it 'renders notebook with tab frames by adding content' do
      tab1_text = 'English'
      tab2_text = 'French'
      @root_proxy = root {
        @subject_proxy = notebook
      }
      
      @subject_proxy.content {
        @frame1_proxy = frame(text: tab1_text, sticky: 'w', padding: '4', image: 'image1', compound: 'center', underline: '0')
        @frame2_proxy = frame(text: tab2_text, sticky: 'e', padding: '5', image: 'image2', compound: 'image', underline: '1')      
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::NotebookProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::Notebook)
      
      expect(@frame1_proxy).to be_a(Glimmer::Tk::FrameProxy)
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'text')).to eq(tab1_text)
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'sticky')).to eq('w')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'padding')).to eq('4')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'image')).to eq('image1')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'compound')).to eq('center')
      expect(@subject_proxy.tk.tabcget_tkstring(0, 'underline')).to eq('0')
      
      expect(@frame2_proxy).to be_a(Glimmer::Tk::FrameProxy)
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'text')).to eq(tab2_text)
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'sticky')).to eq('e')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'padding')).to eq('5')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'image')).to eq('image2')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'compound')).to eq('image')
      expect(@subject_proxy.tk.tabcget_tkstring(1, 'underline')).to eq('1')
    end
  end
end
