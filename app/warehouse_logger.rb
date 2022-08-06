# frozen_string_literal: true

require 'rainbow'
require './app/errors'

class WarehouseLogger
  COMMANDS = {
    'help' => 'Shows this help message',
    'init' => 'W H         (Re)Initialises the application as an empty W x H warehouse.',
    'store' => 'X Y W H P  Stores a crate of product code P and of size W x H at position (X,Y).',
    'locate' => 'P         Show a list of all locations occupied by product code P.',
    'remove' => 'X Y       Remove the entire crate occupying the location (X,Y).',
    'view' => 'Output a visual representation of the current state of the grid.',
    'exit' => 'Exits the application.'
  }.freeze

  def info(message)
    puts Rainbow(message).blue
  end

  def error(message)
    puts Rainbow(message).red
  end

  def warn(message)
    puts Rainbow(message).yellow
  end

  def green(message)
    puts Rainbow(message).green
  end

  def show_help_message_for(command)
    info command.ljust(10) + COMMANDS[command]
  end

  def show_help_message
    COMMANDS.each_key { |command| show_help_message_for(command) }
  end

  def handle_command_response(command)
    response = yield
    send(command_response_name(command), response)
  rescue ArgumentError => e
    error "Invalid arguments send to #{command}\n"
    show_help_message_for(command)
  rescue Errors::WareHouseNotInitializedError => e
    show_uninitialized_message
  rescue Errors::WarehouseError => e
    error e.message
  end

  def show_unrecognized_message
    error 'Command not found. Type `help` for instructions on usage'
  end

  def show_uninitialized_message
    warn 'Warehouse not initialized. Please initialize the Warehouse to continue'
    show_help_message_for('init')
  end

  def show_locate_command_response(boxes)
    return warn 'No boxes found' if boxes.empty?

    boxes.each do |box|
      info "Box named #{box.product_code} found at #{box.x_pos}, #{box.y_pos}"
    end
  end

  def show_remove_command_response(_)
    green 'Box removed'
  end

  def show_store_command_response(_)
    green 'Box stored'
  end

  def show_init_command_response(_)
    green 'Warehouse initialized'
  end

  def show_view_command_response(_); end

  private

  def command_response_name(command)
    "show_#{command}_command_response"
  end
end
