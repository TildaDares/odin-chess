require_relative 'pawn'
class WhitePawn < Pawn
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♙  '
    @row = row
    @column = column
  end
end
