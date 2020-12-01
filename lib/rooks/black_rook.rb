require_relative 'rook'
require 'colorize'
class BlackRook < Rook
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @row = row
    @column = column
    @symbol = '  ♜  '.black
    @piece_color = 'black'
  end
end
