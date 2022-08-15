require_relative 'options'

class Unknown < Options

  def initialize
    super 'Unknown Option'
  end

  def action
    puts 'Option entered is not recognized, please try again or type help for a list of options'
  end
end