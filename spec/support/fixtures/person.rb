class Person 
  attr_accessor :country, :country_options, :provinces, :provinces_options

  def initialize   
    self.country_options=["", "Canada", "US", "Mexico"]
    self.country = "Canada"
    self.provinces_options=[
      "",
      "Quebec",
      "Ontario",
      "Manitoba",
      "Saskatchewan",
      "Alberta",
      "British Columbia",
      "Nova Skotia",
      "Newfoundland",
    ]
    self.provinces = ["Quebec", "Manitoba", "Alberta"]
  end
end    
