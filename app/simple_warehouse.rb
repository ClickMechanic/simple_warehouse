class SimpleWarehouse

  def initialize
    @live = true
    @runner = OptionRunner.new
    @runner.add_option'help', Help.new()
    @runner.add_option'exit', Exit.new()
  end

  def run
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      option = gets.chomp
      @runner.action(option)
      #   else
      #     show_unrecognized_message
      # end
    end
  end

  private

  # def show_help_message
  #   puts <<~HELP
  #     help             Shows this help message
  #     init W H         (Re)Initialises the application as an empty W x H warehouse.
  #     store X Y W H P  Stores a crate of product code P and of size W x H at position (X,Y).
  #     locate P         Show a list of all locations occupied by product code P.
  #     remove X Y       Remove the entire crate occupying the location (X,Y).
  #     view             Output a visual representation of the current state of the grid.
  #     exit.rb             Exits the application.
  #   HELP
  # end

  # def show_unrecognized_message
  #   puts 'Command not found. Type `help` for instructions on usage'
  # end

  # def exit.rb
  #   puts 'Thank you for using simple_warehouse!'
  #   @live = false
  # end

end
