# frozen_string_literal: true
require './lib/piece'
class Pawn < Piece
  private
  
  def capture_diagonally
    dr = @piece_color == 'white' ? [1, 1] : [-1, -1]
    dc = [-1, +1]

    2.times do |i|
      next unless (@row + dr[i]).between?(0, 7) && (@column + dc[i]).between?(0, 7)

      piece_coord = @array[@row + dr[i]][@column + dc[i]]
      next unless piece_coord.is_a?(Piece)
      next if piece_coord.piece_color == @piece_color

      unless piece_coord.piece_color == @piece_color
        @possible_moves[[@row + dr[i], @column + dc[i]]] = [@row + dr[i], @column + dc[i]]
        next
      end
    end
  end
end
