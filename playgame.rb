require './game'
require 'pry'

class PlayGame
  def keep_playing?
    puts "Let's start/keep playing? 'Yes' or 'No'."
    user = gets.chomp.downcase
    case user
      when 'yes' then false
      when 'no' then true
      else puts "I don't understand that command!"
    end
  end
  
  def player_answer
    puts "Player 1, what is your answer?"
    g1 = gets.chomp
    puts "Player 2, what is your answer?"
    g2 = gets.chomp

    return [g1, g2] 
  end

  def answer_checker(guesses, answer, p1_lives, p2_lives)
    if guesses[0] == answer && guesses[1] == answer
      puts "Well done, you both got it right! The answer was #{answer}"
    elsif guesses[0] == answer && guesses[1] != answer
      puts "Well done Player 1, you got it right! The answer was #{answer}. Player 2 you lose a life! "
      p2_lives[1] -= 1
    elsif guesses[0] != answer && guesses[1] == answer
      puts "Well done Player 2, you got it right! The answer was #{answer}. Player 1 you lose a life! "
      p1_lives[1] -= 1
    else
      puts "You both got it wrong! The answer was " + answer + ". You both lose lives :("
      p2_lives[1] -= 1
      p1_lives[1] -= 1
    end
    return [p1_lives, p2_lives]
  end


  def life_display(lives)
    puts "Player 1, you have " +  (lives[0][1]).to_s + " lives left! Player 2, you have " + (lives[1][1]).to_s + " lives left!"
  end

  def game_over?(p_lives)
    if p_lives[0][1] == 0 || p_lives[1][1] == 0
      return true
    else
      return false
    end
  end
end






