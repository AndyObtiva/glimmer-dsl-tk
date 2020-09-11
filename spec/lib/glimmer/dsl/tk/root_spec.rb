require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'root toplevel window widget' do
    include Glimmer
    
    it 'renders root' do
      root_title = 'Window'
      @root_proxy = @proxy = root {
        title root_title
      }
      
      expect(@proxy).to be_a(Glimmer::Tk::RootProxy)
      expect(@proxy.tk).to be_a(::TkRoot)
      expect(@proxy.tk.title).to eq(root_title)
    end
    
    it 'starts mainloop on open' do
      expect(::Tk).to receive(:mainloop)
      
      root.open      
    end
  end
end
