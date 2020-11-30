require_relative 'queen'
require 'colorize'
class BlackQueen < Queen
  attr_reader :symbol
  def initialize
    @symbol = '  ♚  '.black
  end
end
