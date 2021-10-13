require 'glimmer-dsl-tk'

class HelloRadiobutton
  class Person
    attr_accessor :male, :female, :child, :teen, :adult, :senior
    
    def initialize
      reset!
    end
    
    def reset!
      self.male = true
      self.female = nil
      self.child = nil
      self.teen = nil
      self.adult = true
      self.senior = nil
    end
  end
  
  include Glimmer
  
  def initialize
    @person = Person.new
  end
  
  def launch
    root {
      title 'Hello, Radio!'
      background '#ececec' if OS.mac?
      
      label {
        text 'Gender:'
        font 'caption'
      }
      
      frame {
        radiobutton {
          text 'Male'
          variable <=> [@person, :male]
        }
        
        radiobutton {
          text 'Female'
          variable <=> [@person, :female]
        }
      }
      
      label {
        text 'Age Group:'
        font 'caption'
      }
      
      frame {
        radiobutton {
          text 'Child'
          variable <=> [@person, :child]
        }

        radiobutton {
          text 'Teen'
          variable <=> [@person, :teen]
        }

        radiobutton {
          text 'Adult'
          variable <=> [@person, :adult]
        }

        radiobutton {
          text 'Senior'
          variable <=> [@person, :senior]
        }
      }
      
      button {
        text 'Reset'
        
        command do
          @person.reset!
        end
      }
    }.open
  end
end

HelloRadiobutton.new.launch
