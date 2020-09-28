# frozen_string_literal: true

require 'yaml'

# Creates new round of game, displays to command line and controls save/load features
class Round
  include GameLogic

  def initialize
    @secret_word = []
    @strikes = 0
    @blanks = []
    @incorrect_letters = []

    @current_guess = ''
  end

  def load_round(file)
    restored_round = YAML.load(File.read("saved_rounds/#{file}"))

    @secret_word = restored_round[:secret_word]
    @strikes = restored_round[:strikes]
    @blanks = restored_round[:blanks]
    @incorrect_letters = restored_round[:incorrect_letters]
  end

  def generate_round
    current_dictionary = load_dictionary
    generate_secret_word(current_dictionary)
    generate_blanks
  end

  def load_dictionary
    dictionary = File.read '5desk.txt'
    dictionary.split(' ')
  end

  def generate_secret_word(dictionary)
    word = ''
    word = dictionary.sample until word.length >= 5 && word.length <= 12
    @secret_word = word.downcase.split('')
  end

  def generate_blanks
    @blanks = Array.new(@secret_word.length, '_ ')
  end

  def start_round
    display_round_state
    start_player_turn
    display_result
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
    return if @incorrect_letters.empty?

    puts 'Incorrect Letters: '
    print @incorrect_letters.join(' ')
    puts
    puts
  end

  def start_player_turn
    until game_over?
      guess_letter
      check_guess
      display_round_state
      prompt_save_game
      display_warning
    end
  end

  def game_over?
    @strikes == 6 || @blanks == @secret_word
  end

  def display_result
    @strikes == 6 ? (puts "You lose! The word was #{@secret_word.join('')}") : (puts 'You win!')
  end

  def prompt_save_game
    puts "Hit enter to continue or type 'save' to store your game."
    result = gets.chomp
    save_game if result.downcase == 'save' || result.downcase == "'save'"
  end

  def save_game
    time = Time.now

    Dir.mkdir('saved_rounds') unless Dir.exist? 'saved_rounds'

    filename = "saved_rounds/#{time}.yml"

    File.open(filename,'w') do |file|
      file.write self.to_yaml
    end
    puts "Saved! #{filename}"
  end

  def to_yaml
    YAML.dump ({
      secret_word: @secret_word,
      strikes: @strikes,
      blanks: @blanks,
      incorrect_letters: @incorrect_letters
    })
  end

  def display_warning
    puts 'Warning! Final strike!' if @strikes == 5
  end
end
