class OptionRunner
  attr_reader :options

  def initialize
    @options = {}
  end

  def add_option(opt, obj)
    @options[opt] = obj
  end

  def action(opt)
    runner = OptionRunner.new
    obj = @options[runner.run] || Unknown.new()
    obj.action[runner.run]
  end
end