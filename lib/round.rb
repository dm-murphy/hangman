# Next step is check guess

# frozen_string_literal: true

class Round

  def initialize
    @current_dictionary = []
    @secret_word = []
    @strikes = 0
    @incorrect_letters = []
    @current_guess = ''
  end

  def start_round
    load_dictionary
    generate_secret_word(@current_dictionary)
    start_player_turn
  end

  def start_player_turn
    display_round_state
    prompt_save_game
  end

  def prompt_save_game
    puts "Would you like to save your game? (Enter 'save' or enter any other key to skip)"
    result = gets.chomp
    if result.downcase == 'save' || result.downcase == "'save'"
      save_game
    else
      guess_letter
    end
  end

  def save_game
    # Use to save round state
    puts "Not ready yet!"
  end

  def guess_letter
    loop do
      puts 'Guess a letter from the word: '
      @current_guess = gets.chomp
      break if check_valid?

      puts "That's not valid."
    end
  end

  def check_valid?
    @current_guess.count("a-zA-Z").positive? && @current_guess.length == 1
  end

  def load_dictionary
    dictionary = File.read "5desk.txt"
    @current_dictionary = dictionary.split(' ')
  end

  def generate_secret_word(dictionary)
    word = ''
    word = dictionary.sample until word.length >= 5 && word.length <= 12
    @secret_word = word.split('')
    print @secret_word # Keep for debugging
    puts # Keep for debugging
  end

  def display_round_state
    display_blank_spaces
    display_strikes
    display_incorrect_letters
  end

  def display_blank_spaces
    puts 'Secret Word: '
    @secret_word.length.times { print '_ ' }
    puts
    puts
  end

  def display_strikes
    puts 'Strikes: '
    @strikes.times { print '* ' }
    puts
    puts 'Warning! Final strike!' if @strikes == 5
  end

  def display_incorrect_letters
    unless @incorrect_letters.empty?

    puts 'Incorrect Letters: '
    print @incorrect_letters
    puts
    puts
    end
  end
end
