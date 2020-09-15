require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'entry widget' do
    include Glimmer
    
    it 'renders entry with static text' do
      entry_text = 'Hello, World!'
      @root_proxy = root {
        @subject_proxy = entry {
          text entry_text
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::TEntry)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.text).to eq(entry_text)
    end
    
    it 'renders entry with text data-binding' do
      person = Person.new
      @root_proxy = root {
        @subject_proxy = entry {
          text bind(person, :country)
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::TEntry)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.text).to eq(person.country)
      
      person.country = 'US'
      expect(@subject_proxy.text).to eq('US')      
      
      @subject_proxy.tk.insert(2, 'A')
      expect(@subject_proxy.text).to eq('USA')
    end
  end
end
