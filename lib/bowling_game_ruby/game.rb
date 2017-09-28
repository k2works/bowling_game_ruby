# frozen_string_literal: true

module BowlingGameRuby
  class Game
    attr_reader :score

    def initialize
      @scorer = Scorer.new
      @score = 0
      @current_frame = 1
      @first_throw = true
    end

    def score
      score_for_frame(get_current_frame - 1)
    end

    def add(pins)
      @throws[@current_throw] = pins
      @current_throw += 1
      @score += pins
      addjust_current_frame(pins)
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

    def get_current_frame
      [11, @current_frame].min
    end

    private

    def addjust_current_frame(pins)
      if @first_throw
        if pins == 10 # ストライク
          @current_frame += 1
          @first_throw = true
        else
          @first_throw = false
        end
      else
        @current_frame += 1
        @first_throw = true
      end
    end

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
