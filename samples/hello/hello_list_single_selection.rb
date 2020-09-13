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

class HelloListSingleSelection
  include Glimmer
  
  def launch
    person = Person.new
    
    root {      
      title 'Hello, List Single Selection!'
      
      list {
        selection bind(person, :country)
      }
      
      button {
        text "Reset Selection To Default Value"
        
        command { person.reset_country }
      }
    }.open
  end
end

HelloListSingleSelection.new.launch
