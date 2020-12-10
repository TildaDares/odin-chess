# frozen_string_literal: true

require_relative 'rook'
class WhiteRook < Rook
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♖  '
    @row = row
    @column = column
    @piece_color = 'white'
  end

  def move(array)
    @array = array
    @possible_moves = {}
    front_row_checker
    back_row_checker
    right_column_checker
    left_column_checker
    @possible_moves
  end

  private

  def front_row_checker
    (@row + 1).upto(7) do |row|
      break unless movesets(row, @column)
    end
  end

  def back_row_checker
    (@row - 1).downto(0) do |row|
      break unless movesets(row, @column)
    end
  end
end
