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
  end
end
