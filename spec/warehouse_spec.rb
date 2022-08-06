# frozen_string_literal: true

require 'spec_helper'

describe Warehouse do
  subject { Warehouse.new(10, 10) }

  describe '#initialize' do
    context 'sets values for attr readers' do
      it { expect(subject.width).to eq(10) }
      it { expect(subject.height).to eq(10) }

      context 'when dimensions are passed as string' do
        subject { Warehouse.new('5', '5') }

        it 'is converted to integer' do
          expect(subject.width).to eq(10)
          expect(subject.height).to eq(10)
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

  describe '#store' do
    let(:box) { box = Crate.new(1, 1, 10, 10, 'p_code') }

    it 'appends the box to boxes array' do
      expect { subject.store(box) }.to change { subject.boxes.length }.by(1)
    end
    context 'when box does not fit inside warehouse' do

      context 'when box is too big' do
        let(:box) { box = Crate.new(1, 1, 100, 100, 'p_code') }
        it 'raises error' do
          expect { subject.store(box) }.to raise_error(Errors::BoxDoesNotFitError)
        end
      end

      context 'when box overhangs outside warehouse' do
        let(:box) { box = Crate.new(5, 5, 7, 7, 'p_code') }
        it 'raises error' do
          expect { subject.store(box) }.to raise_error(Errors::BoxDoesNotFitError)
        end
      end

    end
  end
end
