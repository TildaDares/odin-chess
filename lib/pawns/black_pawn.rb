require_relative 'pawn'

class BlackPawn < Pawn
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @symbol = '  ♟  '
    @row = row
    @column = column
    @piece_color = 'black'
  end

  def move(array)
    @array = array
    @legal_moves = []
    pawn_first_move
    capture_diagonally
  end

  def pawn_first_move
    add_row = @row - 1
    add_row2 = @row - 2
    2.times do
      return if @array[add_row][@column].is_a?(Piece) || add_row.negative?

      @legal_moves << [add_row, @column]
      return unless @row == 6

      add_row = add_row2
    end
  end
end
