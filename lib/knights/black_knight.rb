require_relative 'knight'
require 'colorize'
class BlackKnight < Knight
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♞  '.black
    @row = row
    @column = column
  end
end
