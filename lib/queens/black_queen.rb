require_relative 'queen'
require 'colorize'
class BlackQueen < Queen
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♚  '.black
    @row = row
    @column = column
  end
end
