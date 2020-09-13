require 'spec_helper'

module GlimmerSpec # used to house Glimmer mixin
  describe 'list widget' do
    include Glimmer
    
    it 'renders single selection list (browse selectmode) with text and command' do
      person = Person.new
      @root_proxy = root {
        @subject_proxy = list {
          selectmode 'browse'
          selection bind(person, :country)
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::ListProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::Treeview)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.items).to eq(person.country_options)
      expect(@subject_proxy.selection).to eq([person.country])
      expect(@subject_proxy.selectmode).to eq('browse')
      
      @subject_proxy.selection = 'US'
      ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
      expect(person.country).to eq('US')
      
      person.country = 'Mexico'
      expect(@subject_proxy.selection).to eq(['Mexico'])
      
      person.country_options << 'Italy'
      expect(@subject_proxy.items).to eq(['', 'Canada', 'US', 'Mexico', 'Italy'])
    end
    
    it 'renders multi selection list (default extended selectmode) with text and command' do
      person = Person.new
      @root_proxy = root {
        @subject_proxy = list {
          selection bind(person, :provinces)
        }
      }
      
      expect(@subject_proxy).to be_a(Glimmer::Tk::ListProxy)
      expect(@subject_proxy.tk).to be_a(::Tk::Tile::Treeview)
      expect(@subject_proxy.parent_proxy).to eq(@root_proxy)
      expect(@subject_proxy.items).to eq(person.provinces_options)
      expect(@subject_proxy.selection).to eq(person.provinces)
      expect(@subject_proxy.selectmode).to eq('extended')
      
      @subject_proxy.selection = ['Quebec', 'Ontario']
      ::Tk.event_generate(@subject_proxy.tk, '<TreeviewSelect>')
      expect(person.provinces).to eq(['Quebec', 'Ontario'])
      
      person.provinces << 'Newfoundland'
      expect(@subject_proxy.selection).to eq(['Quebec', 'Ontario', 'Newfoundland'])
      
      person.provinces_options << 'Yukon'
      expect(@subject_proxy.items).to eq(person.provinces_options)
    end
    
    # TODO test block attribute support for -xscrollcommand yscrollcommand
  end
end
