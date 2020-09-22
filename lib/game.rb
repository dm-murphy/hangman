# frozen_string_literal: true

class Game

  def play_game
    display_intro
    start_game    
  end
 
  def display_intro
    puts <<-HEREDOC

Welcome to Hangman, the classic word guessing game!

Guess letters from the secret word until you complete the word.

For each letter that is not in the secret word you earn a strike.

Six strikes loses the game.

Good luck.

HEREDOC
  end

  def start_game
    load_game? ? prompt_load_game : new_round
  end

  def load_game?
    puts 'Would you like to load a saved game? (y/n)'
    answer = gets.chomp
    answer.downcase == 'y' ? true : false
  end

  def prompt_load_game
    puts "Select the game file you would like to load: "
    # open_saved_file
  end

  def open_saved_file
    # Open the saved file
  end

  def new_round
    @round = Round.new
    @round.start_round
  end
end