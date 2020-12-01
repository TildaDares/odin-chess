require_relative 'king'
class WhiteKing < King
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @symbol = '  ♔  '
    @row = row
    @column = column
    @piece_color = 'white'
  end
end
