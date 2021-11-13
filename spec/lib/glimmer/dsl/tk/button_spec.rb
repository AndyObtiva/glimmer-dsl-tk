require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'button widget' do
    include Glimmer
    
    it 'renders button with text and command' do
      button_text = 'Submit'
      @button_invoked = false
      @root_proxy = root {
        @subject_proxy = button {
          text button_text
          command {
            @button_invoked = true
          }
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::Button)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.tk.text).to eq(button_text)
      expect(@button_invoked).to eq(false)
      @subject_proxy.tk.invoke
      expect(@button_invoked).to eq(true)
    end
  end
end
