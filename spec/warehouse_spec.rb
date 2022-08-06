# frozen_string_literal: true

require 'spec_helper'

describe Warehouse do
  subject { described_class.new(10, 10) }

  describe '#initialize' do
    describe 'sets values for attr readers' do
      it { expect(subject.width).to eq(10) }
      it { expect(subject.height).to eq(10) }

      context 'when dimensions are passed as string' do
        subject { described_class.new('5', '5') }

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

  describe '#store' do
    let(:crate) { Crate.new(1, 1, 10, 10, 'p_code') }

    it 'appends the box to boxes array' do
      expect { subject.store(crate) }.to change { subject.boxes.length }.by(1)
    end

    context 'when box does not fit inside warehouse' do
      context 'when box is too big' do
        let(:crate) { Crate.new(1, 1, 100, 100, 'p_code') }

        it 'raises error' do
          expect { subject.store(crate) }.to raise_error(Errors::BoxDoesNotFitError)
        end
      end

      context 'when box overhangs outside warehouse' do
        let(:crate) { Crate.new(5, 5, 7, 7, 'p_code') }

        it 'raises error' do
          expect { subject.store(crate) }.to raise_error(Errors::BoxDoesNotFitError)
        end
      end
    end

    context 'when box collides with another box' do
      let(:crate) { instance_double(Crate, collide?: true) }
      let(:new_create) { Crate.new(1, 1, 2, 2, 'p_code') }

      before do
        subject.boxes << crate
      end

      it 'raises error' do
        expect { subject.store(new_create) }.to raise_error(Errors::BoxCollidesWithAnotherBoxError)
      end
    end
  end

  describe '#remove' do
    before do
      subject.boxes << crate
    end

    context 'when removing a box that exists' do
      let(:crate) { instance_double(Crate, touch?: true) }

      it 'removes the box' do
        expect { subject.remove(0, 0) }.to change { subject.boxes.length }.by(-1)
      end
    end

    context 'when removing a box that does not exists' do
      let(:crate) { instance_double(Crate, touch?: false) }

      it 'raises error' do
        expect { subject.remove(0, 0) }.to raise_error(Errors::BoxDoesNotExistError)
      end
    end
  end
end
