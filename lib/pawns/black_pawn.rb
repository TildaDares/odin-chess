# frozen_string_literal: true
require_relative 'pawn'

class BlackPawn < Pawn
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♟  '
    @row = row
    @column = column
    @piece_color = 'black'
  end

  def move(array)
    @array = array
    @possible_moves = {}
    pawn_first_move
    capture_diagonally
    @possible_moves
  end

  def pawn_first_move
    add_row = @row - 1
    add_row2 = @row - 2
    2.times do
      return if @array[add_row][@column].is_a?(Piece) || add_row.negative?

      @possible_moves[[add_row, @column]] = [add_row, @column]
      return unless @row == 6

      add_row = add_row2
    end
  end
end
