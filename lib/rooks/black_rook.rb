require_relative 'rook'
require 'colorize'
class BlackRook < Rook
  attr_reader :symbol, :row, :column, :piece_color, :legal_moves
  def initialize(row, column)
    @row = row
    @column = column
    @symbol = '  ♜  '.black
    @piece_color = 'black'
  end

  def move(array)
    @array = array
    @legal_moves = []
    front_row_checker
    back_row_checker
    right_column_checker
    left_column_checker
  end

  def front_row_checker
    (@row - 1).downto(0) do |row|
      break unless row_checker(row)
    end
  end

  def back_row_checker
    (@row + 1).upto(7) do |row|
      break unless row_checker(row)
    end
  end
end
