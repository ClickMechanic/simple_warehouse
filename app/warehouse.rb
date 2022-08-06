# frozen_string_literal: true

require './app/errors'

class Warehouse
  attr_reader :width, :height

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    @boxes = []

    raise Errors::InvalidWarehouseDimensions unless @height.positive? || @width.positive?
  end
end
