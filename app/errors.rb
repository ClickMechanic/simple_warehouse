module Errors
  class WarehouseError < StandardError; end

  class InvalidBoxDimensions < WarehouseError
    def message
      'Box must have proper height and width'
    end
  end
end
