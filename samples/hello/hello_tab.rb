require 'glimmer-dsl-tk'

class HelloTab
  include Glimmer
  
  def launch
    root {      
      title 'Hello, Tab!'
       
      notebook {
        frame(text: 'English') {
          label {
            text 'Hello, World!'
          }
        }
         
        frame(text: 'French') {
          label {
            text 'Bonjour, Univers!'
          }
        }
      }
    }.open
  end
end

HelloTab.new.launch
