# frozen_string_literal: true

require 'spec_helper'

describe Warehouse do
  subject { Warehouse.new(5, 5) }

  describe '#initialize' do
    context 'sets values for attr readers' do

      it { expect(subject.width).to eq(5) }
      it { expect(subject.height).to eq(5) }

      context 'when dimensions are passed as string' do
        subject { Warehouse.new('5', '5') }

        it 'is converted to integer' do
          expect(subject.width).to eq(5)
          expect(subject.height).to eq(5)
        end
      end
    end

    context 'when the warehouse dimensions as zero' do
      it 'raises error' do
        expect do
          described_class.new(0, 0)
        end.to raise_error(Errors::InvalidWarehouseDimensions)
      end
    end

    context 'when the warehouse dimensions are negative' do
      it 'raises error' do
        expect do
          described_class.new(-4, -5)
        end.to raise_error(Errors::InvalidWarehouseDimensions)
      end
    end

  end
end
