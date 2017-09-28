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
      @scorer.add_throw(pins)
      @score += pins
      addjust_current_frame(pins)
    end

    def score_for_frame(the_frame)
      @scorer.score_for_frame(the_frame)
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
  end
end
