require 'warehouse'
Dir.glob(File.expand_path('commands/*.rb', __dir__)).each { require _1 }

# REPL for warehouse access
class CommandLineInterface
  COMMANDS = [Help, Init, Exit].freeze

  HINT = 'Type `help` for instructions on usage'
  UNRECOGNISED_MESSAGE = "Command not found. #{HINT}".freeze

  def initialize(warehouse = Warehouse.new, stdin = $stdin, stdout = $stdout)
    @warehouse = warehouse
    @stdin = stdin
    @stdout = stdout
    @commands = COMMANDS.map { [_1.command, _1] }.to_h
  end

  def run
    stdout.puts HINT
    loop do
      command, *args = read_command_line
      stdout.puts command_result(command, args)

      break if command == 'exit'
    end
  end

  private

  attr_reader :warehouse, :stdin, :stdout, :commands

  def command_result(command, args)
    process command, args
  rescue StandardError => e
    e
  end

  def process(command, args)
    return UNRECOGNISED_MESSAGE unless commands.keys.include? command

    commands[command].new(warehouse).execute(args)
  end

  def read_command_line
    stdout.print '> '
    stdin.gets.chomp.split
  end
end
