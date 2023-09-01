require 'spec_helper'
require 'command_line_interface'

describe Help do
  describe '.command' do
    subject { described_class.command }
    it { is_expected.to eq 'help' }
  end

  describe '#execute' do
    subject { described_class.new(nil).execute([]) }

    all_commands = CommandLineInterface::COMMANDS.map(&:command)
    it { is_expected.to include(*all_commands) }

    all_args = CommandLineInterface::COMMANDS.map(&:args)
    it { is_expected.to include(*all_args) }

    all_helps = CommandLineInterface::COMMANDS.map(&:help)
    it { is_expected.to include(*all_helps) }
  end
end
