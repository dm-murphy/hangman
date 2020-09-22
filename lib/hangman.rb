# class Game
 # def initialize
  #  @strikes = 0
  #  @guessed_letters
 # end

 # def display_intro
  #  puts <<-HEREDOC 
 
 # Welcome to Hangman, the classic word guessing game!

 # Guess letters from the secret word until you complete the word.

 # For each letter that is not in the secret word you earn a strike.

#  Six strikes loses the game.

#  Good luck.

   # HEREDOC
#  end

#  def start_game
#    load_game? ? prompt_load_game : new_game
#  end

#  def load_game?
#    puts 'Would you like to load a saved game? (y/n)'
#    answer = gets.chomp
#    answer.downcase == 'y' ? true : false
#  end

#  def prompt_load_game
#    puts "Select the game file you would like to load: "
    # open_saved_file
#  end

#  def open_saved_file
    # Open the saved file
#  end

#  def new_game
#    load_dictionary
#    generate_secret_word
#    @strikes = 0 
#    @blanks
#  end

#  def display_game_state
#    display_strikes
#    display_blank_spaces
#  end

#  def start_player_loop
#    until game_over?
#      prompt_player_turn
#    end
#  end

#  def game_over?
#    @strike == 6 ? true : false
    # And something to check for win
#  end

#  def prompt_player_turn
#    puts "Guess a single letter or enter SAVE"
#    answer = gets.chomp
#    unless answer == SAVE
#      @guessed_letters.push(answer)
#    else
#      save_game
#    end
#  end

#  def save_game
    # Save game state as file
#  end

#  def check_guessed_letters
#    @guessed_letters #loop against #@secret_word
    # if match
      #@blanks.push(letter, index)
    # else 
      #@strikes += 1
    #end
#  end

#  def display_strikes
#    print "*" #times @strikes
#    @strikes == 5 ? (puts "Final strike!")
#  end

#  def display_blanks
#    puts @blanks
#  end

#  def load_dictionary
    # load the dictionary text file into game
#  end

#  def generate_secret_word
#   use the loaded fictionary file to generate secret_word
#  end
# end


# class Round






# end











# module GameLogic






# end
