require_relative 'queen'
require 'colorize'
class BlackQueen < Queen
  attr_reader :symbol, :row, :column, :piece_color, :legal_moves
  def initialize(row, column)
    @symbol = '  ♚  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end

  def move(array)
    @array = array
    @legal_moves = []
    queen_moves
  end

  def queen_moves
    rook = BlackRook.new(@row, @column)
    bishop = BlackBishop.new(@row, @column)
    rook.move(@array)
    bishop.move(@array)
    @legal_moves = rook.legal_moves + bishop.legal_moves
  end
end
