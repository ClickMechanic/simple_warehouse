require_relative 'options'

class InitWarehouse < Options

  def initialize
    super '(Re)Initialises the application as an empty W x H warehouse.'
  end

  def action(option_args)
    Warehouse.new(option_args)
    puts "You have created a warehouse of size: #{option_args[0]} x #{option_args[1]}"
  end
end
