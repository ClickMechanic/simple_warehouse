# frozen_string_literal: true

require './app/errors'

class Warehouse
  attr_reader :width, :height, :boxes

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    @boxes = []

    raise Errors::InvalidWarehouseDimensions unless @height.positive? || @width.positive?
  end

  # @param [Box] box
  # @return nil
  # @raise Errors::BoxDoesNotFitError
  def store(box)
    raise Errors::BoxDoesNotFitError unless within_bounds?(box)

    boxes << box
  end

  private

  # @param [Box] box
  def within_bounds?(box)
    [box.x1, box.x2].min >= 1 &&
      [box.x1, box.x2].max <= width + 1 &&
      [box.y1, box.y2].min >= 1 &&
      [box.y1, box.y2].max <= height + 1
  end

end
