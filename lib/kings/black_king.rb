require_relative 'king'
require 'colorize'

class BlackKing < King
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♚  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end
end
