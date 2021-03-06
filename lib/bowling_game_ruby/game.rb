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
      score_for_frame(@current_frame)
    end

    def add(pins)
      @scorer.add_throw(pins)
      addjust_current_frame(pins)
    end

    def score_for_frame(the_frame)
      @scorer.score_for_frame(the_frame)
    end

    private

    def addjust_current_frame(pins)
      if last_ball_in_frame(pins)
        advance_frame
      else
        @first_throw = false
      end
    end

    def last_ball_in_frame(pins)
      strike?(pins) || !@first_throw
    end

    def strike?(pins)
      @first_throw && pins == 10
    end

    def advance_frame
      @current_frame = [10, @current_frame + 1].min
    end
  end
end
