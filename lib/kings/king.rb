require './lib/piece'
class King < Piece
  attr_reader :legal_moves
  def move(array)
    @legal_moves = {}
    @array = array
    movesets
  end

  def movesets
    dr = [-1, -1, -1, 0, 0, +1, +1, +1]
    dc = [-1, 0, +1, -1, +1, -1, 0, +1]
    8.times do |i|
      next unless (@row + dr[i]).between?(0, 7) && (@column + dc[i]).between?(0, 7)

      piece_coord = @array[@row + dr[i]][@column + dc[i]]

      if piece_coord.is_a?(Piece)
        next if piece_coord.piece_color == @piece_color
      end
      @legal_moves[[@row + dr[i], @column + dc[i]]] = [@row + dr[i], @column + dc[i]]
    end
  end
end
