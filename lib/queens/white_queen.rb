require_relative 'queen'
class WhiteQueen < Queen
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♔  '
    @row = row
    @column = column
  end
end
