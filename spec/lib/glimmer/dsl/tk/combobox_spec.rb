require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'combobox widget' do
    include Glimmer
    
    it 'renders combobox with state, values, and selected text' do
      person = Person.new
      
      @root_proxy = root {
        @subject_proxy = combobox { |proxy|
          state 'readonly'       
          text bind(person, :country)
        }        
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::TCombobox)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.tk.state).to eq('readonly')
      expect(@subject_proxy.tk.values).to eq(person.country_options)
      expect(@subject_proxy.tk.textvariable.value).to eq(person.country)
      
      @subject_proxy.tk.textvariable.value = 'US'
      ::Tk.event_generate(@subject_proxy.tk, '<ComboboxSelected>')
      expect(person.country).to eq('US')
      
      person.country = 'Mexico'
      expect(@subject_proxy.tk.textvariable.value).to eq('Mexico')
    end
    
    it 'renders combobox with state, values, and selected text with data-binding on_read coverter' do
      person = Person.new
      
      @root_proxy = root {
        @subject_proxy = combobox { |proxy|
          state 'readonly'       
          text bind(person, :country, on_read: -> (c) {"Country: #{c}"})
        }        
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::TCombobox)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.tk.state).to eq('readonly')
      expect(@subject_proxy.tk.values).to eq(person.country_options)
      expect(@subject_proxy.tk.textvariable.value).to eq("Country: #{person.country}")
      
      @subject_proxy.tk.textvariable.value = 'US'
      ::Tk.event_generate(@subject_proxy.tk, '<ComboboxSelected>')
      expect(person.country).to eq('US')
      
      person.country = 'Mexico'
      expect(@subject_proxy.tk.textvariable.value).to eq('Country: Mexico')
    end
    
    # TODO test block attribute support for -postcommand
  end
end
