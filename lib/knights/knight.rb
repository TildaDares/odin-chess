require './lib/piece'
class Knight < Piece
  attr_reader :legal_moves
  def move(array)
    @array = array
    @legal_moves = []
    create_children
  end

  def create_children
    chess_row = [-1, 2, 2, 1, -1, -2, -2, 1]
    chess_col = [2, 1, -1, -2, -2, -1, 1, 2]
    valid_moves = []
    8.times do |i|
      possible_coord = [@row + chess_row[i], @column + chess_col[i]]
      valid_moves << possible_coord if possible_coord[0].between?(0, 7) && possible_coord[1].between?(0, 7)
    end

    valid_moves.each do |valid_coord|
      if @array[valid_coord[0]][valid_coord[1]].is_a?(Piece)
        next if @array[valid_coord[0]][valid_coord[1]].piece_color == @piece_color
      end

      @legal_moves << [valid_coord[0], valid_coord[1]]
    end
  end
end
