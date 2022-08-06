module Errors
  class WarehouseError < StandardError; end

  class InvalidBoxDimensions < WarehouseError
    def message
      'Box must have proper height and width'
    end
  end

  class InvalidWarehouseDimensions < WarehouseError
    def message
      'Warehouse must have proper height and width'
    end
  end

  class BoxDoesNotFitError < WarehouseError
    def message
      'Box has to fit inside the warehouse'
    end
  end

  class BoxCollidesWithAnotherBoxError < WarehouseError
    def message
      'Boxes cannot be stacked on top of each other'
    end
  end

  class BoxDoesNotExistError < WarehouseError
    def message
      'There exists no box at that coordinates'
    end
  end

end
