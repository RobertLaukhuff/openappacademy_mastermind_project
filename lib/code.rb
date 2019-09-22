require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? {|ch| POSSIBLE_PEGS.keys.include?(ch.upcase)}
  end

  def initialize(pegs)
    raise "Invalid Pegs" if !Code.valid_pegs?(pegs)
    @pegs = pegs.map {|peg| peg.upcase}
  end

  def self.random(length)
    Code.new(Array.new(length) {POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(pegs)
    Code.new(pegs.split(''))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    exact_matches = 0
    guess.pegs.each_with_index do |peg, idx|
      if peg == @pegs[idx]
        exact_matches += 1
      end
    end
    exact_matches
  end

  def num_near_matches(guess)
    near_matches = 0
    guess.pegs.each_with_index do |peg, idx|
      if @pegs.include?(peg) && peg != @pegs[idx]
        near_matches += 1
      end
    end
    near_matches
  end

  def ==(code)
    if @pegs == code.pegs
      true
    else
      false
    end
  end
end