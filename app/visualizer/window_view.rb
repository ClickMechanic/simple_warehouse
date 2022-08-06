# frozen_string_literal: true

require 'ruby2d'

class Visualizer
  class WindowView
    MARGIN = 100
    GRID_Z_INDEX = 2
    SHAPES_Z_INDEX = 1

    attr_reader :window, :warehouse_height, :warehouse_width

    def initialize(warehouse_width, warehouse_height)
      @warehouse_height = warehouse_height
      @warehouse_width = warehouse_width
      setup_window
    end

    # @param [Array<Box>] boxes
    def draw_boxes(boxes)
      boxes.each do |box|
        Rectangle.new(
          x: x_coordinate(box.x_pos - 1),
          y: y_coordinate(box.y_pos - 1),
          width: (box.width * grid_size),
          height: -(box.height * grid_size),
          color: 'blue',
          z: SHAPES_Z_INDEX
        )
      end
      show
    end

    private

    def setup_window
      Window.clear

      Window.set({
                   title: 'Press ALT + Tab to go back',
                   background: 'white',
                   width: canvas_width,
                   height: canvas_height
                 })

      # This doesnt seem to be working for some reason
      # issue with Open-GL i guess
      Window.on :mouse do |_event|
        Window.close
      end

      draw_grids
    end

    def show
      Window.show
    end

    def x_coordinate(x)
      x * grid_size
    end

    # since ruby2d uses TL coordinate system and boxes are stored in BL coordinate
    # we have to convert the y position value to the correct coordinate value
    def y_coordinate(y)
      (canvas_height - y * grid_size)
    end

    def draw_grids
      warehouse_height.times do |index|
        Line.new(x1: 0,
                 x2: canvas_width,
                 y1: grid_size * index,
                 y2: grid_size * index,
                 color: 'gray',
                 z: GRID_Z_INDEX
        )
      end

      warehouse_width.times do |index|
        Line.new(x1: grid_size * index,
                 x2: grid_size * index,
                 y1: 0,
                 y2: canvas_height,
                 color: 'gray',
                 z: GRID_Z_INDEX
                 )
      end
    end

    def display_width
      Window.display_width - MARGIN
    end

    def display_height
      Window.display_height - MARGIN
    end

    def grid_size
      @grid_size ||= [
        (display_width / warehouse_width),
        (display_height / warehouse_height)
      ].min
    end

    def canvas_width
      warehouse_width * grid_size
    end

    def canvas_height
      warehouse_height * grid_size
    end
  end
end
