require 'commands/command'
require 'command_line_interface'

class Help < Command
  COMMAND = 'help'
  ARGS = ''
  HELP = 'Shows this help message'

  def execute(_args)
    things = CommandLineInterface::COMMANDS.to_h do |command_object|
      ["#{command_object.command} #{command_object.args}", command_object.help]
    end

    max_command_length = things.keys.map(&:length).max

    things.map do |left, right|
      "#{left.ljust(max_command_length, ' ')}  #{right}"
    end.join("\n")
  end
end
