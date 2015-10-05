require './player_collection'
require './generator'
require './playgame'

class PlayerInterface

  def initialize
    @players_collection = PlayerCollection.new
    @generator = Generator.new
    @play = PlayGame.new
  end

  def game_start #this works
    while true
      puts "What would you like to do? Either: 'play', 'display player', 'display all players' 'add player', 'edit player' ,'delete player' or 'quit'."
      command = gets.chomp
      case command
        when 'play' then game_play
        when 'display all players' then game_display_all_players
        when 'display player' then game_display_player
        when 'add player' then game_add_player
        when 'edit player' then game_edit_player
        when 'delete player' then game_delete_player
        when 'quit' then game_quit
        else puts 'Command is not recognized.'
      end 
    end
  end

  def game_play
    while true
      break if @players_collection.check_min_players?
      break if @play.keep_playing?
      #p1 lives and p2 lives are arrays
      puts "Player 1, what is your name?"
      player1 = gets.chomp
      p1_lives = @players_collection.link_to_round(player1)
     
      puts "Player 2, what is your name?"
      player2 = gets.chomp
      p2_lives = @players_collection.link_to_round(player2)

      while true
        p1_lives
        p2_lives

        @generator.question
        guesses = @play.player_answer
        answer = @generator.answer

        lives_lost = @play.answer_checker(guesses, answer, p1_lives, p2_lives)
       
        @play.life_display(lives_lost)
        break if @play.game_over?(lives_lost)
        puts "NEW ROUND!"
      end
    end
  end

  def game_display_all_players #this works fully
    @players_collection.display_all
  end

  def game_display_player #this works fully
     puts "What is the name of the player you would like to find?"
     name = gets.chomp.downcase
     @players_collection.display_player(name)
  end

  def game_add_player #this works fully
    puts "Enter new player name:"
    name = gets.chomp.downcase
    puts "Enter your age:"
    age = gets.chomp.downcase
    puts "Enter your specialty, i.e. 'Division', 'Subtraction', 'Addition', 'Multiplication'."
    specialty = gets.chomp.downcase
    @players_collection.add_player(name, age, specialty)
  end

  def game_edit_player # error when accessing the second element of the array, reverts to else first, then the if
    puts "Which player would you like to edit?"
    name = gets.chomp.downcase
    binding.pry
    @players_collection.edit_player(name)
    binding.pry
  end

  def game_delete_player # this works fully
    puts "Which player would you like to delete?"
    name = gets.chomp.downcase
    @players_collection.delete_player(name)
  end

  def game_quit
    #QUIT the game
    return false
  end
end