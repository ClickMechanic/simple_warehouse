class Command
  def initialize(warehouse = nil)
    @warehouse = warehouse
  end

  def self.command
    self::COMMAND
  end

  def self.help
    self::HELP
  end

  def self.args
    self::ARGS
  end

  protected

  attr_accessor :warehouse
end
