class OptionReader
  attr_reader :option_args

  def initialize(opt)
    @option_args = []
    @opt = opt
  end

  def read
    case @opt
      when /help/
        'help'
      when /init\s(.*)\s(.*)/
        @option_args << $1.to_i
        @option_args << $2.to_i
        # p option_args
        'init'
      when 'exit'
        'exit'
      else
        'unknown'
    end
  end
end