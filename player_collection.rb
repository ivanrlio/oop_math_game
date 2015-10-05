require './player'
require './playgame'
require './generator'
require 'pry'


class PlayerCollection

  attr_accessor :players

  def initialize
    @players = []
  end

  def check_min_players? 
    if @players.size < 2
      puts "The number of players stored in the database is too small.  At least two players are required."
      return true
    else
      return false
    end
  end

  def display_player(name) # this works fully
    if @players == []
      puts "There are no players in the database!"
    else
      @players.find do |player|
        if player.name == name
          puts "Name: #{player.name} | Age: #{player.age} | Specialty: #{player.specialty}"
        else
          puts "#{name} was not found!"
        end
      end
    end
  end

  def display_all
    if @players == []
      puts "There are no players in the database!"
    else
      @players.each do |player|
        puts "Name: #{player.name} | Age: #{player.age} | Specialty: #{player.specialty}"
      end
    end
  end

  def add_player(name, age, specialty)
    add_player = Player.new(name, age, specialty)
    @players << add_player
    @player_2_lives
    p "#{name} was added to the database!"
  end

  def edit_player(name)
    binding.pry
    @players.each do |player|
      if player.name == name
        puts "What would you like to edit? Type either 'name' or 'specialty'."
        command = gets.chomp
        case command
        when 'name'
          puts "Please enter your desired name."
          player.name = gets.chomp
          puts "Your name has been changed from #{name} to #{player.name}."
        when 'specialty'
          puts "Please enter your new specialty."
          player.specialty = gets.chomp
          puts "Your name has been changed from #{specialty} to #{player.specialty}."
        else
        end
      else
        puts "A player by that name does not exist!"
      end
    end
    binding.pry
  end
  
  def link_to_round(name) ##not workign properly
      @players.each do |player|
        if player.name == name
          return [player.name, player.lives]
        end
      end    
  end

  def delete_player(name) #loop through and slice player out
    if @players == []
      puts "The database is empty!"
    else
      @players.each_with_index do |player, index|
        if player.name == name
          @players.delete_at(index)
          puts "#{player.name} was successfully deleted!"
        else
          puts "A player by that name does not exist!"
        end
      end
    end 
  end
end