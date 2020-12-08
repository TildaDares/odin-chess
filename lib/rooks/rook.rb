# frozen_string_literal: true

require './lib/piece'
class Rook < Piece
  private

  def movesets(row, col)
    piece_coord = @array[row][col]
    if piece_coord.is_a?(Piece)
      return false if piece_coord.piece_color == @piece_color

      unless piece_coord.piece_color == @piece_color
        @possible_moves[[row, col]] = [row, col]
        return false
      end
    end
    @possible_moves[[row, col]] = [row, col]
    true
  end

  def right_column_checker
    (@column + 1).upto(7) do |col|
      break unless movesets(@row, col)
    end
  end

  def left_column_checker
    (@column - 1).downto(0) do |col|
      break unless movesets(@row, col)
    end
  end
end
