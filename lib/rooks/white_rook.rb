require_relative 'rook'
class WhiteRook < Rook
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♖  '
    @row = row
    @column = column
  end
end
