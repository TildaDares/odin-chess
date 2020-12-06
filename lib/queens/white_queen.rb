require_relative 'queen'
class WhiteQueen < Queen
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♕  '
    @row = row
    @column = column
    @piece_color = 'white'
  end

  def move(array)
    @array = array
    @possible_moves = {}
    queen_moves
    @possible_moves
  end

  def queen_moves
    rook = WhiteRook.new(@row, @column)
    bishop = WhiteBishop.new(@row, @column)
    @possible_moves = rook.move(@array).merge(bishop.move(@array))
  end
end
