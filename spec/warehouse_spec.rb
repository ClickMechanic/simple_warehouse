require 'spec_helper'
require 'warehouse'

describe Warehouse do
  let(:unit) { Warehouse.new }

  describe '#init' do
    it 'creates a new warehouse with width and height' do
      warehouse = Warehouse.new(1, 2)

      expect(warehouse.width).to eq 1
    end

    it 'creates a representation of a grid' do
      warehouse = Warehouse.new(1, 2)

      expect(warehouse.grid).not_to be_empty
      expect(warehouse.grid).to be_a(Array)
    end
  end
end
