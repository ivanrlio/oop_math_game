require './player_collection'
require './game'
require './playgame'
 
class Player #this works

  attr_accessor :name, :specialty, :age, :lives

  def initialize(name, age = nil, specialty)
    @name = name
    @age = age
    @specialty = specialty
    @lives = 3
    
  end

  
  

end
