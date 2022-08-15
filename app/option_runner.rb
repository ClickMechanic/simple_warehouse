require_relative 'option_reader'

class OptionRunner
  attr_reader :options

  def initialize
    @options = {}
  end

  def add_option(opt, obj)
    @options[opt] = obj
  end

  def action(opt)
    reader = OptionReader.new(opt)
    obj = @options[reader.read] || Unknown.new()
    obj.action[reader.read]
  end
end