require_relative 'required_files'

describe OptionRunner do
  before :each do
    @runner = OptionRunner.new
  end

  describe '#add_option' do
    it 'should add the correct option to run' do
      @runner.add_option('help', Help.new)

      expect(@runner.options.count).to eql(1)
    end
  end
end