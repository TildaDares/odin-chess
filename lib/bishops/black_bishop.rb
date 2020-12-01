require_relative 'bishop'
require 'colorize'
class BlackBishop < Bishop
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @symbol = '  ♝  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end
end
