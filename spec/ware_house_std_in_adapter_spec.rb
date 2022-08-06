require 'spec_helper'

describe WareHouseStdInAdapter do

  let(:warehouse) { instance_double(Warehouse) }
  let(:crate) { instance_double(Crate) }

  before do
    allow(Warehouse).to receive(:new).and_return(warehouse)
    allow(Crate).to receive(:new).and_return(warehouse)
  end

  subject { described_class.new }


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

  describe 'initialized?' do
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

end
