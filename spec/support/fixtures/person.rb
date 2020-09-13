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
