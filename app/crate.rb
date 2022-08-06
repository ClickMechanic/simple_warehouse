# frozen_string_literal: true

require './app/errors'

class Crate
  attr_reader :x_pos, :y_pos, :width, :height, :product_code

  alias x1 x_pos
  alias y1 y_pos
  def initialize(x_pos, y_pos, width, height, product_code)
    @x_pos = x_pos.to_i
    @y_pos = y_pos.to_i
    @width = width.to_i
    @height = height.to_i
    @product_code = product_code

    raise Errors::InvalidBoxDimensions if @width.zero? || @height.zero?
  end

  # @return [Integer]
  def x2
    x1 + width
  end

  # @return [Integer]
  def y2
    y1 + height
  end

  # checks if the given point is inside the crate or not
  # @param [Integer] x_coordinate
  # @param [Integer] y_coordinate
  # @return [TrueClass, FalseClass]
  def touch?(x_coordinate, y_coordinate)
    x_coordinate >= x1 &&
      x_coordinate < x2 &&
      y_coordinate >= y1 &&
      y_coordinate < y2
  end
end
