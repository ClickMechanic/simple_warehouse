require 'spec_helper'
require 'commands/exit'

describe Exit do
  describe '.command' do
    subject { described_class.command }
    it { is_expected.to eq 'exit' }
  end

  describe '#execute' do
    subject { described_class.new(nil).execute([]) }

    it { is_expected.to eq 'Thank you for using simple_warehouse!' }
  end
end
