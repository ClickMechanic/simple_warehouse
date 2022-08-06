# frozen_string_literal: true

require 'rspec'
require './app/crate'
require './app/errors'

describe Crate do
  subject { Crate.new(1, 1, 2, 2, 'p_code') }

  describe '#initialize' do
    context 'sets values for attr readers' do

      it { expect(subject.x_pos).to eq(1) }
      it { expect(subject.y_pos).to eq(1) }
      it { expect(subject.width).to eq(2) }
      it { expect(subject.height).to eq(2) }
      it { expect(subject.product_code).to eq('p_code') }

      context 'when coordinates are passed as string' do
        subject { Crate.new('0', '0', '1', '1', 'p_code') }

        it 'is converted to integer' do
          expect(subject.x_pos).to eq(0)
          expect(subject.y_pos).to eq(0)
          expect(subject.width).to eq(1)
          expect(subject.height).to eq(1)
        end
      end
    end

    context 'when the box dimensions are zero' do
      it 'raises error' do
        expect do
          described_class.new(0, 0, 0, 0, 'p_code')
        end.to raise_error(Errors::InvalidBoxDimensions)
      end
    end

    context 'when the box dimensions are negative' do
      it 'raises error' do
        expect do
          described_class.new(0, 0, -2, -3, 'p_code')
        end.to raise_error(Errors::InvalidBoxDimensions)
      end
    end

  end

  describe 'alias methods' do
    it 'returns same value for both methods' do
      expect(subject.x_pos).to eq(subject.x1)
      expect(subject.y_pos).to eq(subject.y1)
    end
  end

  describe '#x2' do
    it 'is sum of x1 + width' do
      expect(subject.x2).to eq(3)
    end
  end

  describe '#y2' do
    it 'is sum of y1 + height' do
      expect(subject.y2).to eq(3)
    end
  end

  describe '#touch?' do
    subject { Crate.new(1, 1, 5, 5, 'p_code') }

    context 'when given given coordinate is outside the box' do
      it 'returns false' do
        expect(subject.touch?(6, 6)).to eq(false)
        expect(subject.touch?(0, 0)).to eq(false)
      end
    end

    context 'when given given coordinate is inside the box' do
      it 'returns true' do
        expect(subject.touch?(2,3)).to eq(true)
      end
    end

    context 'when given given coordinate is at edge of the box' do
      it 'returns true' do
        expect(subject.touch?(1, 1)).to eq(true)
        expect(subject.touch?(5, 5)).to eq(true)
      end
    end

  end
end
