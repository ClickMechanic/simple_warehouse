class OptionReader
  attr_reader :option_args

  def initialize(opt)
    @opt = opt
  end

  if @opt == 'help'
    'help'
  elsif @opt == 'exit'
    'exit'
  elsif @opt.include? 'init'
    puts @opt
  else
    'unknown'
  end
end