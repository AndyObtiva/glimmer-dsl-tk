require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'combobox widget' do
    include Glimmer
    
    before :all do
      class Person 
        attr_accessor :country, :country_options
      
        def initialize   
          self.country_options=["", "Canada", "US", "Mexico"]
          self.country = "Canada"
        end
      
        def reset_country
          self.country = "Canada"
        end
      end    
    end
    
    after :all do
      Object.send(:remove_const, :Person) if Object.const_defined?(:Person)
    end
    
    it 'renders combobox with state, values, and selected text' do
      person = Person.new
      
      @root_proxy = root {
        @proxy = combobox { |proxy|
          state 'readonly'       
          text bind(person, :country)
        }        
      }
      
      expect(@proxy).to be_a(Glimmer::Tk::WidgetProxy)
      expect(@proxy.tk).to be_a(::Tk::Tile::TCombobox)
      expect(@proxy.parent_proxy).to eq(@root_proxy)
      expect(@proxy.tk.state).to eq('readonly')
      expect(@proxy.tk.values).to eq(person.country_options)
      expect(@proxy.tk.textvariable.value).to eq(person.country)
      
      @proxy.tk.textvariable.value = 'US'
      ::Tk.event_generate(@proxy.tk, '<ComboboxSelected>')
      expect(person.country).to eq('US')
      
      person.country = 'Mexico'
      expect(@proxy.tk.textvariable.value).to eq('Mexico')
    end
    
    # TODO test block attribute support for -postcommand
  end
end
