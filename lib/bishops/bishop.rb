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
        i = row_idx[step]
        j = col_idx[step]
        while (@row + i).between?(0, 7) && (@column + j).between?(0, 7)
          piece_coord = @array[@row + i][@column + j]
          if piece_coord.is_a?(Piece)
            break if piece_coord.piece_color == @piece_color

            unless piece_coord.piece_color == @piece_color
              @possible_moves[[@row + i, @column + j]] = [@row + i, @column + j]
              break
            end
          end
          @possible_moves[[@row + i, @column + j]] = [@row + i, @column + j]
          i = row_idx[step] * (i.abs + 1)
          j = col_idx[step] * (j.abs + 1)
        end
      end
    end
end
