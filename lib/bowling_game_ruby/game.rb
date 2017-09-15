# frozen_string_literal: true

module BowlingGameRuby
  class Game
    attr_reader :score

    def initialize
      @score = 0
      @current_throw = 0
      @throws = Array.new(21, 0)
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
        @first_throw = @throws[@ball]

        score += if strike
                   @ball += 1
                   10 + next_two_balls
                 else
                   handle_second_throw
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

    def handle_second_throw
      frame_score = 0
      second_throw = @throws[@ball + 1]
      frame_score = @first_throw + second_throw

      # スペアの得点計算には次のフレームの第１投が必要
      if spare
        @ball += 2
        frame_score + next_ball
      else
        @ball += 2
        frame_score
      end
    end

    def strike
      @first_throw == 10
    end

    def next_two_balls
      @throws[@ball] + @throws[@ball + 1]
    end

    def spare
      @throws[@ball] + @throws[@ball + 1] == 10
    end

    def next_ball
      @throws[@ball]
    end
  end
end
