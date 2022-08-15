require_relative 'options'

class Exit < Options

  def initialize
    super 'Exits the application.'
  end

  def action(option_args)
    exit
  end
end