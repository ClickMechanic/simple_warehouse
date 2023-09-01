require 'spec_helper'
require 'command_line_interface'
require 'mock_io'

describe CommandLineInterface do
  unit = nil

  include MockIO

  def test_run(input, warehouse = spy('Warehouse'))
    with_mock_io do |stdin, user_input, stdout|
      unit = described_class.new(warehouse, stdin, stdout)
      user_input.puts input
      user_input.puts 'exit'
      unit.run
      return stdout.string
    end
  end

  describe 'command unrecognised' do
    subject { test_run('fhelp') }
    it { is_expected.to include('Command not found') }
  end

  it 'can run several commands' do
    warehouse = double('Warehouse', init: nil)

    with_mock_io do |stdin, user_input, stdout|
      unit = described_class.new(warehouse, stdin, stdout)

      user_input.puts 'init 15 15'
      user_input.puts 'exit'
      unit.run

      expect(stdout.string).to include('Thank you')
    end
  end
end
