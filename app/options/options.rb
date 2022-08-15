class Options
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def action(option_args)
    StandardError.new 'Not Yet Implemented'
  end

end