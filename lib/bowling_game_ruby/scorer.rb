# frozen_string_literal: true

module BowlingGameRuby
  class Scorer
    def initialize
      @current_throw = 0
      @throws = Array.new(21, 0)
    end
  end
end
