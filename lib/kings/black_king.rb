require_relative 'king'
require 'colorize'

class BlackKing < King
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @symbol = '  ♚  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end
end
