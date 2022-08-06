require './app/ware_house_std_in_adapter'
require './app/warehouse_logger'

class SimpleWarehouse

  def run
    @live = true
    @adapter = WareHouseStdInAdapter.new
    @logger = WarehouseLogger.new

    @logger.green 'Type `help` for instructions on usage'

    while @live
      print '> '
      input = gets.chomp.split(/\s+/)
      command, *arguments = input

      case command
      when 'help'
        show_help_message
      when 'init', 'store', 'locate', 'remove', 'view'
        @logger.handle_command_response(command) do
          @adapter.public_send(command, *arguments)
        end
      when 'exit'
        exit
      else
        @logger.show_unrecognized_message
      end
    end
  end

  private

  def exit
    @logger.green 'Thank you for using simple_warehouse!'
    @live = false
  end

end
