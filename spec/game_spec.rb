# frozen_string_literal: true

require 'spec_helper'
include BowlingGameRuby

RSpec.describe BowlingGameRuby::Game do
  let(:g) { Game.new }

  describe '#score' do
    context 'when two throw' do
      it 'scored' do
        g.add(5)
        g.add(4)
        expect(g.score).to eq(9)
      end
    end

    context 'when spare' do
      it 'scored' do
        g.add(3)
        g.add(7)
        g.add(3)
        g.add(2)
        expect(g.score).to eq(18)
      end

      it 'scored' do
        9.times do
          g.add(10)
        end
        g.add(9)
        g.add(1)
        g.add(1)
        expect(g.score).to eq(270)
      end
    end

    context 'when strike' do
      it 'scored' do
        g.add(10)
        g.add(3)
        g.add(6)
        expect(g.score).to eq(28)
      end
    end

    context 'when perfect game' do
      it 'scored' do
        12.times do
          g.add(10)
        end
        expect(g.score).to eq(300)
      end
    end

    context 'when 10th frame' do
      it 'scored' do
        9.times do
          g.add(0)
          g.add(0)
        end
        g.add(2)
        g.add(8)  # 10番目のフレームのスペア
        g.add(10) # 配列の最後にストライク
        expect(g.score).to eq(20)
      end
    end

    context 'when playing one game' do
      it 'scored' do
        pins = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
        pins.each do |pin|
          g.add(pin)
        end
        expect(g.score).to eq(133)
      end
    end
  end

  describe '#score_for_frame' do
    context 'when four throws' do
      it 'scored by frame' do
        g.add(5)
        g.add(4)
        g.add(7)
        g.add(2)
        expect(g.score_for_frame(1)).to eq(9)
        expect(g.score_for_frame(2)).to eq(18)
      end
    end

    context 'when spare' do
      it 'scored by frame' do
        g.add(3)
        g.add(7)
        g.add(3)
        g.add(2)
        expect(g.score_for_frame(1)).to eq(13)
        expect(g.score_for_frame(2)).to eq(18)
      end
    end

    context 'when strike' do
      it 'scored by frame' do
        g.add(10)
        g.add(3)
        g.add(6)
        expect(g.score_for_frame(1)).to eq(19)
      end
    end
  end
end
