class OptionReader
  attr_reader :option_args

  def initialize(opt)
    option_args = []
    @opt = opt
  end

  def read
    case @opt
      when 'help'
        'help'
      when /init/
        puts @opt
      when 'exit'
        'exit'
      else
        'unknown'
    end
  end


  # if @opt == 'help'
  #   'help'
  # elsif @opt == 'exit'
  #   'exit'
  # elsif @ 'init'
  #   puts @opt
  # else
  #   'unknown'
  # end
end