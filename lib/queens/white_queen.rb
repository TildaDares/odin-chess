require_relative 'queen'
class WhiteQueen < Queen
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♔  '
    @row = row
    @column = column
    @piece_color = 'white'
  end

  def move(array)
    @array = array
    @legal_moves = {}
    queen_moves
  end

  def queen_moves
    rook = WhiteRook.new(@row, @column)
    bishop = WhiteBishop.new(@row, @column)
    rook.move(@array)
    bishop.move(@array)
    @legal_moves = rook.legal_moves + bishop.legal_moves
  end
end
