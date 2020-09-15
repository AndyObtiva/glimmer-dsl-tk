require 'glimmer-dsl-tk'

require_relative 'hello_computed/contact'

class HelloComputed
  include Glimmer

  def initialize
    @contact = Contact.new(
      first_name: 'Barry',
      last_name: 'McKibbin',
      year_of_birth: 1985
    )
  end

  def launch
    root {
      title 'Hello, Computed!'
      frame {
        label {text 'First Name: '}
        entry {
          text bind(@contact, :first_name)
        }
        label {text 'Last Name: '}
        entry {
          text bind(@contact, :last_name)
        }
        label {text 'Year of Birth: '}
        entry {
          text bind(@contact, :year_of_birth)
        }
        label {text 'Name: '}
        label {
          text bind(@contact, :name, computed_by: [:first_name, :last_name])
        }
        label {text 'Age: '}
        label {
          text bind(@contact, :age, on_write: :to_i, computed_by: [:year_of_birth])
        }
      }
    }.open
  end
end

HelloComputed.new.launch
