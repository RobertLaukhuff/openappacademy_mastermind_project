require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    print "exact matches: #{@secret_code.num_exact_matches(code)}"
    print "near matches: #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    print "Enter a code: "
    pegs = gets.chomp.upcase
    guess = Code.from_string(pegs)
    print_matches(guess)
    guess == @secret_code
  end
end
