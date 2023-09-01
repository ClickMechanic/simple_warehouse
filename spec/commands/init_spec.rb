require 'spec_helper'
require 'commands/init'

describe Init do
  describe '.command' do
    subject { described_class.command }
    it { is_expected.to eq 'init' }
  end
end
