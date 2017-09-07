require "spec_helper"
include BowlingGameRuby

RSpec.describe BowlingGameRuby::Game do
  describe '#score' do
    context 'when one throw' do
        it '#scored' do
          g = Game.new
          g.add(5)
          expect(g.score).to eq(5)
        end
    end
  end
end