require_relative 'king'
class WhiteKing < King
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♔  '
    @row = row
    @column = column
    @piece_color = 'white'
  end
end
