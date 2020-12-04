require_relative 'queen'
require 'colorize'
class BlackQueen < Queen
  attr_reader :symbol, :piece_color, :possible_moves
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♚  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end

  def move(array)
    @array = array
    @possible_moves = {}
    queen_moves
  end

  def queen_moves
    rook = BlackRook.new(@row, @column)
    bishop = BlackBishop.new(@row, @column)
    rook.move(@array)
    bishop.move(@array)
    @possible_moves = rook.possible_moves.merge(bishop.possible_moves)
  end
end
