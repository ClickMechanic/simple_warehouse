require './app/warehouse'
require './app/crate'
require './app/errors'

class WareHouseStdInAdapter
  attr_reader :warehouse

  def initialize
    @warehouse = nil
  end

  def init(width, height)
    @warehouse = Warehouse.new(width.to_i, height.to_i)
  end

  def initialized?
    !@warehouse.nil?
  end

  def store(x_pos, y_pos, width, height, p_code)
    raise Errors::WareHouseNotInitializedError unless initialized?

    crate = Crate.new(x_pos.to_i, y_pos.to_i, width.to_i, height.to_i, p_code)
    warehouse.store(crate)
  end

  def remove(x_pos, y_pos)
    raise Errors::WareHouseNotInitializedError unless initialized?

    warehouse.remove(x_pos.to_i, y_pos.to_i)
  end

end
