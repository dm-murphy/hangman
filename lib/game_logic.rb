# frozen_string_literal: true

# Contains logic for taking and checking guesses
module GameLogic
  @secret_word = []
  @strikes = 0
  @blanks = []
  @incorrect_letters = []
  @current_guess = ''

  def guess_letter
    loop do
      puts 'Guess a letter from the word: '
      @current_guess = gets.chomp
      break if check_valid?

      puts "That's not valid."
    end
  end

  def check_valid?
    @current_guess.count('a-zA-Z').positive? && @current_guess.length == 1 &&
      @incorrect_letters.include?(@current_guess) == false
  end

  def check_guess
    check_strikes
    check_blanks
  end

  def check_strikes
    unless @secret_word.include?(@current_guess.downcase)
      @strikes += 1
      @incorrect_letters.push(@current_guess) 
    end
  end

  def check_blanks
    @secret_word.each_with_index do |l, index|
      @blanks[index] = l if l == @current_guess.downcase
    end
  end
end
