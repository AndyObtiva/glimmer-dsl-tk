require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'root toplevel window widget' do
    include Glimmer
    
    it 'renders root' do
      root_title = 'Window'
      @root_proxy = @subject_proxy = root {
        title root_title
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::RootProxy)
      expect(@subject_proxy.tk).to be_a(::TkRoot)
      expect(@subject_proxy.tk.title).to eq(root_title)
    end
    
    it 'adds content to root' do
      root_title = 'Window'
      @root_proxy = @subject_proxy = root
      @subject_proxy.content {
        title root_title
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::RootProxy)
      expect(@subject_proxy.tk).to be_a(::TkRoot)
      expect(@subject_proxy.tk.title).to eq(root_title)
    end
    
    it 'starts mainloop on open' do
      expect(::Tk).to receive(:mainloop)
      
      root.open      
    end
  end
end
