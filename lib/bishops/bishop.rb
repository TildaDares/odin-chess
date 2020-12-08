# frozen_string_literal: true

require './lib/piece'
class Bishop < Piece
  def move(array)
    @array = array
    @possible_moves = {}
    diagonals
    @possible_moves
  end

  private

  def diagonals
    row_idx = [+1, -1, +1, -1]
    col_idx = [+1, -1, -1, +1]
    4.times do |step|
      add_row = row_idx[step]
      add_col = col_idx[step]
      while (@row + add_row).between?(0, 7) && (@column + add_col).between?(0, 7)
        piece_coord = @array[@row + add_row][@column + add_col]
        if piece_coord.is_a?(Piece)
          break if piece_coord.piece_color == @piece_color

          unless piece_coord.piece_color == @piece_color
            @possible_moves[[@row + add_row, @column + add_col]] = [@row + add_row, @column + add_col]
            break
          end
        end
        @possible_moves[[@row + add_row, @column + add_col]] = [@row + add_row, @column + add_col]
        add_row = row_idx[step] * (add_row.abs + 1)
        add_col = col_idx[step] * (add_col.abs + 1)
      end
    end
  end
end
