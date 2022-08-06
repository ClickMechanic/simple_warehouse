# frozen_string_literal: true

require 'rspec'
require './app/crate'
require './app/errors'

describe Crate do
  describe '#initialize' do
    context 'sets values for attr readers' do
      subject { Crate.new(0, 0, 1, 1, 'p_code') }

      it { expect(subject.x_pos).to eq(0) }
      it { expect(subject.y_pos).to eq(0) }
      it { expect(subject.width).to eq(1) }
      it { expect(subject.height).to eq(1) }
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

    context 'when the box dimensions as invalid' do
      it 'raises error' do
        expect do
          described_class.new(0, 0, 0, 0, 'p_code')
        end.to raise_error(Errors::InvalidBoxDimensions)
      end
    end
  end
end
