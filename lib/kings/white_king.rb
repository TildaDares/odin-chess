require_relative 'king'
class WhiteKing < King
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol =  '  ♔  '
    @row = row
    @column = column
  end
end
