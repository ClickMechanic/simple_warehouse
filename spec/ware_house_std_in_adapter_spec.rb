# frozen_string_literal: true

require 'spec_helper'

describe WareHouseStdInAdapter do
  subject { described_class.new }

  let(:warehouse) { instance_double(Warehouse) }
  let(:crate) { instance_double(Crate) }

  before do
    allow(Warehouse).to receive(:new).and_return(warehouse)
    allow(Crate).to receive(:new).and_return(crate)
  end

  describe '#init' do
    it 'creates new instance of warehouse' do
      subject.init(10, 20)
      expect(subject.warehouse).to eq(warehouse)
    end

    it 'converts string dimensions to integer' do
      subject.init('10', '20')
      expect(Warehouse).to have_received(:new).with(10, 20)
    end
  end

  describe '#initialized?' do
    context 'when initialized' do
      it 'return true' do
        subject.init('10', '20')
        expect(subject.initialized?).to eq(true)
      end
    end

    context 'when not initialized' do
      it 'return true' do
        expect(subject.initialized?).to eq(false)
      end
    end
  end

  describe '#store' do
    before do
      subject.init('10', '20')
      allow(warehouse).to receive(:store)
    end

    it 'stores box in warehouse' do
      subject.store(0, 0, 0, 0, 'p')
      expect(warehouse).to have_received(:store).with(crate)
    end

    context 'values are passed as strings' do
      it 'converts everything to integer' do
        subject.store('0', '0', '0', '0', 'p')
        expect(Crate).to have_received(:new).with(0, 0, 0, 0, 'p')
      end
    end
  end

  describe '#remove' do
    before do
      subject.init('10', '20')
      allow(warehouse).to receive(:remove)
    end

    it 'removes box from warehouse' do
      subject.remove(0, 0)
      expect(warehouse).to have_received(:remove).with(0, 0)
    end

    context 'values are passed as strings' do
      it 'converts everything to integer' do
        subject.remove('0', '0', )
        expect(warehouse).to have_received(:remove).with(0, 0)
      end
    end
  end
end
