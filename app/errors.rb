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

end