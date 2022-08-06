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

  def x2
    x1 + width
  end

  def y2
    y1 + height
  end
end
