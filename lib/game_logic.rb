# frozen_string_literal: true

module GameLogic

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
