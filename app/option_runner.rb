class OptionRunner
  attr_reader :options

  def initialize
    @options = {}
  end

  def add_option(opt, obj)
    @options[opt] = obj
  end

  def action(opt)
    @options[opt].action
  end
end