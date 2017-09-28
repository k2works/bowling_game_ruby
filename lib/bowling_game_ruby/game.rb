# frozen_string_literal: true

module BowlingGameRuby
  class Game
    attr_reader :score

    def initialize
      @scorer = Scorer.new
      @current_frame = 1
      @first_throw = true
    end

    def score
      score_for_frame(get_current_frame - 1)
    end

    def add(pins)
      @scorer.add_throw(pins)
      addjust_current_frame(pins)
    end

    def score_for_frame(the_frame)
      @scorer.score_for_frame(the_frame)
    end

    def get_current_frame
      @current_frame
    end

    private

    def addjust_current_frame(pins)
      if (@first_throw && pins == 10 || !@first_throw)
        advance_frame
        @first_throw = true
      else
        @first_throw = false
      end
      @current_frame = [11, @current_frame].min
    end

    def adjust_frame_for_strike(pins)
      if pins == 10
        advance_frame
        true
      else
        false
      end
    end

    def advance_frame
      @current_frame += 1
    end
  end
end
