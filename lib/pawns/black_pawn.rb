require_relative 'pawn'

class BlackPawn < Pawn
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @symbol = '  ♟  '
    @row = row
    @column = column
    @piece_color = 'black'
  end
end
