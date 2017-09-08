# frozen_string_literal: true

module BowlingGameRuby
  class Game
    attr_reader :score

    def initialize
      @score = 0
      @current_throw = 0
      @throws = Array.new(21, 0)
    end

    def add(pins)
      @throws[@current_throw] = pins
      @current_throw += 1
      @score += pins
    end

    def score_for_frame(the_frame)
      score = 0
      ball = 0
      current_frame = 0
      while current_frame < the_frame
        first_throw = @throws[ball]
        ball += 1
        second_throw = @throws[ball]
        ball += 1
        score += first_throw + second_throw
        current_frame += 1
      end
      score
    end
  end
end
