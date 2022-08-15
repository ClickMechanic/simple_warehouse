require_relative 'options'

class Exit < Options

  def initialize
    super 'Exits the application.'
  end

  def action
    exit
  end
end