# frozen_string_literal: true

class Round

  def initialize
    @current_dictionary = []
    @secret_word = []
    @strikes = 5
  end

  def start_round
    load_dictionary
    generate_secret_word(@current_dictionary)
    display_round_state
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
end
