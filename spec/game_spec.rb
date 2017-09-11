# frozen_string_literal: true

require 'spec_helper'
include BowlingGameRuby

RSpec.describe BowlingGameRuby::Game do
  let(:g) { Game.new }

  describe '#score' do
    context 'when one throw' do
      it 'scored' do
        g.add(5)
        expect(g.score).to eq(5)
      end
    end

    context 'when two throw' do
      it 'scored' do
        g.add(5)
        g.add(4)
        expect(g.score).to eq(9)
      end
    end

    context 'when spare' do
      it 'scored'
    end
  end

  describe '#score_for_frame' do
    context 'when four throws' do
      it 'scored' do
        g.add(5)
        g.add(4)
        g.add(7)
        g.add(2)
        expect(g.score_for_frame(1)).to eq(9)
        expect(g.score_for_frame(2)).to eq(18)
      end
    end

    context 'when spare' do
      it 'scored' do
        g.add(3)
        g.add(7)
        g.add(3)
        g.add(2)
        expect(g.score_for_frame(1)).to eq(13)
        expect(g.score_for_frame(2)).to eq(18)
      end
    end
  end

  describe '#get_current_frame' do
    context 'when one throw' do
      it 'return first frame' do
        g.add(5)
        expect(g.get_current_frame).to eq(1)
      end
    end

    context 'when two throw' do
      it 'return second frame' do
        g.add(5)
        g.add(4)
        expect(g.get_current_frame).to eq(2)
      end
    end

    context 'when spare' do
      it 'return third frame' do
        g.add(3)
        g.add(7)
        g.add(3)
        expect(g.get_current_frame).to eq(2)
      end

      it 'return third frame' do
        g.add(3)
        g.add(7)
        g.add(3)
        g.add(2)
        expect(g.get_current_frame).to eq(3)
      end
    end
  end
end
