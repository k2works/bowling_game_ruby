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
      addjust_current_frame
    end

    def score_for_frame(the_frame)
      score = 0
      ball = 0
      current_frame = 0
      while current_frame < the_frame
        first_throw = @throws[ball]
        ball += 1

        if first_throw == 10
          second_throw = @throws[ball]
          third_throw = @throws[ball + 1]
          frame_score = first_throw + second_throw + third_throw
          score = frame_score
          current_frame += 1
        else
          second_throw = @throws[ball]
          ball += 1
          frame_score = first_throw + second_throw

          # スペアの得点計算には次のフレームの第１投が必要
          score += if frame_score == 10
                     frame_score + @throws[ball]
                   else
                     frame_score
                   end
          current_frame += 1
        end
      end
      score
    end

    def get_current_frame
      @current_frame
    end

    private

    def addjust_current_frame
      if @first_throw
        if @throws[@current_throw - 1] == 10
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
