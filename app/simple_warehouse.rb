class SimpleWarehouse

  def initialize
    @live = true
    @runner = OptionRunner.new
    @runner.add_option'help', Help.new()
    @runner.add_option'exit', Exit.new()
    @runner.add_option 'init', InitWarehouse()
  end

  def run
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      option = gets.chomp
      @runner.action(option)
    end
  end
end
