require './app/warehouse'

class WareHouseStdInAdapter
  attr_reader :warehouse

  def initialize(warehouse = Warehouse, crate = Crate )
    @warehouse = nil
  end

  def init(width, height)
    @warehouse = Warehouse.new(width.to_i, height.to_i)
  end

  def initialized?
    !@warehouse.nil?
  end

end
