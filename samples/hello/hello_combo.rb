require 'glimmer-dsl-tk'

class Person
  attr_accessor :country, :country_options

  def initialize
    self.country_options=["", "Canada", "US", "Mexico"]
    self.country = "Canada"
  end

  def reset_country
    puts 'resetting...'
    self.country = "Canada"
  end
end

class HelloCombo
  include Glimmer
  
  def launch
    person = Person.new
    
    root {
      title 'Hello, Combo!'
      
      combobox { |proxy|
        state 'readonly'       
        values person.country_options
#         selection bind(person, :country)
#         proxy.tk.bind('<ComboboxSelected>') {puts 'combo'}
      }
      
      button { |proxy|
        text "Reset Selection"
        command {
          person.reset_country
        }
      }
    }.open
  end
end

HelloCombo.new.launch
