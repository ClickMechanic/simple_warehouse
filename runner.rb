require './app/simple_warehouse'
require './app/option_runner'


require './app/options/help'
require './app/options/exit'
require './app/options/unknown'
require './app/options/init_warehouse'

SimpleWarehouse.new.run
