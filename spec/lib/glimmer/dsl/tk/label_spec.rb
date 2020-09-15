require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'label widget' do
    include Glimmer
    
    it 'renders label with static text' do
      label_text = 'Hello, World!'
      @root_proxy = root {
        @subject_proxy = label {
          text label_text
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::Label)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.tk.text).to eq(label_text)
    end
    
    it 'renders label with text data-binding' do
      person = Person.new
      @root_proxy = root {
        @subject_proxy = label {
          text bind(person, :country)
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::Label)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.tk.text).to eq(person.country)
      
      person.country = 'US'
      expect(@subject_proxy.tk.text).to eq('US')      
    end
  end
end
