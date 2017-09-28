# frozen_string_literal: true

module BowlingGameRuby
  class Scorer
    def initialize
      @current_throw = 0
      @throws = Array.new(21, 0)
    end

    def add_throw(pins)
      @throws[@current_throw] = pins
      @current_throw += 1
    end

    def score_for_frame(the_frame)
      score = 0
      @ball = 0
      current_frame = 0

      while current_frame < the_frame
        if strike?
          @ball += 1
          score += 10 + next_two_balls
        elsif spare?
          @ball += 2
          score += 10 + next_ball
        else
          score += two_balls_in_frame
          @ball += 2
        end

        current_frame += 1
      end
      score
    end

    private

    def strike?
      @throws[@ball] == 10
    end

    def next_two_balls
      @throws[@ball] + @throws[@ball + 1]
    end

    def spare?
      (@throws[@ball] + @throws[@ball + 1]) == 10
    end

    def next_ball
      @throws[@ball]
    end

    def two_balls_in_frame
      @throws[@ball] + @throws[@ball + 1]
    end
  end
end
