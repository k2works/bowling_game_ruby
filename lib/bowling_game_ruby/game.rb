module BowlingGameRuby
  class Game
    def initialize
      @score = 0
    end

    def score
      @score
    end

    def add(pins)
      @score = pins
    end
  end
end