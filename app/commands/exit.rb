require 'commands/command'

class Exit < Command
  COMMAND = 'exit'
  ARGS = ''
  HELP = 'Exits the application.'

  def execute(_args)
    'Thank you for using simple_warehouse!'
  end
end
