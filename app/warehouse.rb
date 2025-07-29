class Warehouse
  attr_accessor :width, :height, :grid

  def initialize(width, height)
    @width = width
    @height = height
    @grid = Array.new(width) { Array.new(height) }
  end
end
