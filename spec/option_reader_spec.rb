require_relative 'required_files'

describe OptionReader do
  before :each do
    @reader = OptionReader.new('init 5 6')
  end

  describe '#read' do
    it 'should return a command and values for the init' do
      expect(@reader.read).to eql('init')
      expect(@reader.option_args).to eql([5, 6])
    end
  end
end
