# frozen_string_literal: true

# Creates new round of game, displays to command line and controls save/load features
class Round
  include GameLogic

  def initialize
    @current_dictionary = []
    @secret_word = []
    @strikes = 0
    @blanks = []
    @incorrect_letters = []
    @current_guess = ''
  end

  def start_round
    load_dictionary
    generate_secret_word(@current_dictionary)
    generate_blanks
    display_round_state
    start_player_turn
  end

  def load_dictionary
    dictionary = File.read "5desk.txt"
    @current_dictionary = dictionary.split(' ')
  end

  def generate_secret_word(dictionary)
    word = ''
    word = dictionary.sample until word.length >= 5 && word.length <= 12
    @secret_word = word.downcase.split('')
    print @secret_word # Keep for debugging
    puts # Keep for debugging
  end

  def generate_blanks
    @blanks = Array.new(@secret_word.length, '_ ')
  end

  def display_round_state
    puts
    display_blank_spaces
    display_strikes
    display_incorrect_letters
  end

  def display_blank_spaces
    puts 'Secret Word: '
    puts @blanks.join("")
    puts
  end

  def display_strikes
    puts 'Strikes: '
    @strikes.times { print '* ' }
    puts
    puts
  end

  def display_incorrect_letters
    unless @incorrect_letters.empty?

    puts 'Incorrect Letters: '
    print @incorrect_letters.join(' ')
    puts
    puts
    end
  end

  def start_player_turn
    until game_over?
      guess_letter
      check_guess
      display_round_state
      prompt_save_game
      display_warning
    end
    display_result
  end

  def game_over?
    @strikes == 6 || @blanks == @secret_word
  end

  def display_result
    @strikes == 6 ? (puts 'You lose!') : (puts 'You win!')
  end

  def prompt_save_game
    puts "Hit enter to continue or type 'save' to store your game."
    result = gets.chomp
    save_game if result.downcase == 'save' || result.downcase == "'save'"
  end

  def save_game
    # Use to save round state
    puts "Not ready yet!"
  end

  def display_warning
    puts 'Warning! Final strike!' if @strikes == 5
  end
end
