require_relative 'bishop'
require 'colorize'
class BlackBishop < Bishop
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♝  '.black
    @row = row
    @column = column
  end
end
