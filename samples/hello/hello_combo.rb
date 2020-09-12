require 'glimmer-dsl-tk'

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

class HelloCombo
  include Glimmer
  
  def launch
    person = Person.new
    
    root {
      title 'Hello, Combo!'
      
      combobox { |proxy|
        state 'readonly'       
        text bind(person, :country)
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
