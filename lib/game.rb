# frozen_string_literal: true

# Chooses new game or loads previously saved file
class Game

  def play_game
    display_intro
    prompt_game
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

  def prompt_game
    puts "Hit enter to start a new game or type 'load' to bring up a saved file."
    load_game? ? prompt_load_game : new_round
  end

  def load_game?
    result = gets.chomp
    result.downcase == 'load' || result.downcase == "'load'"
  end

  def prompt_load_game
    puts 'Select the number for the saved .yml file you would like to load: '
    Dir.entries('saved_rounds').each_with_index do |file, index|
      print index
      print '  =  '
      print file
      puts
    end
    check_file
  end

  def check_file
    save_number = gets.chomp.to_i
    if save_number > 1
      print 'Loading... '
      loaded_file = Dir.entries('saved_rounds')[save_number]
      puts loaded_file
      load_saved_round(loaded_file)
    else
      puts "That's not valid. Goodbye!"
    end
  end

  def load_saved_round(file)
    @round = Round.new
    @round.load_round(file)
    @round.start_round
  end

  def new_round
    @round = Round.new
    @round.generate_round
    @round.start_round
  end
end
