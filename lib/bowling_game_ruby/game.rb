# frozen_string_literal: true

module BowlingGameRuby
  class Game
    attr_reader :score

    def initialize
      @score = 0
    end

    def add(pins)
      @score += pins
    end

    def score_for_frame(the_frame)
      0
    end
  end
end
