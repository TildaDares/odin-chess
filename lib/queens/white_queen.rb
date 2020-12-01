require_relative 'queen'
class WhiteQueen < Queen
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @symbol = '  ♔  '
    @row = row
    @column = column
    @piece_color = 'white'
  end
end
