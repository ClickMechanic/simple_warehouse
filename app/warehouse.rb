# frozen_string_literal: true

require './app/errors'

class Warehouse
  attr_reader :width, :height, :boxes

  def initialize(width, height)
    @width = width
    @height = height
    @boxes = []

    raise Errors::InvalidWarehouseDimensions unless @height.positive? || @width.positive?
  end

  # @param [Box] box
  # @return nil
  # @raise Errors::BoxDoesNotFitError
  def store(box)
    raise Errors::BoxDoesNotFitError unless within_bounds?(box)
    raise Errors::BoxCollidesWithAnotherBoxError unless space_available?(box)

    boxes << box
  end

  def remove(x_pos, y_pos)
    box_index = @boxes.index { |box| box.touch?(x_pos, y_pos) }

    raise Errors::BoxDoesNotExistError if box_index.nil?
    @boxes.delete_at(box_index)
  end

  def locate(product_code)
    @boxes.filter { |box| box.product_code == product_code }
  end

  def view(visualizer)
    visualizer.draw_boxes(boxes)
  end

  private

  # @param [Box] box
  def within_bounds?(box)
    [box.x1, box.x2].min >= 1 &&
      [box.x1, box.x2].max <= width + 1 &&
      [box.y1, box.y2].min >= 1 &&
      [box.y1, box.y2].max <= height + 1
  end

  def space_available?(box)
    boxes.filter { |stored_box| stored_box.collide?(box) }.empty?
  end

end
