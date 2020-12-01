require_relative 'knight'
require 'colorize'
class BlackKnight < Knight
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @symbol = '  ♞  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end
end
