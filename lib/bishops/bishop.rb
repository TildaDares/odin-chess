require './lib/piece'
class Bishop < Piece
  attr_reader :legal_moves
  def move(array)
    @array = array
    @legal_moves = []
    downwards_diagonal
    upwards_diagonal
    downwards_anti_diagonal
    upwards_anti_diagonal
  end

  private

  def downwards_diagonal
    i = 1
    while @row + i <= 7 && @column + i <= 7
      piece_coord = @array[@row + i][@column + i]
      if piece_coord.is_a?(Piece)
        break if piece_coord.piece_color == @piece_color

        unless piece_coord.piece_color == @piece_color
          @legal_moves << [@row + i, @column + i]
          break
        end
      end
      @legal_moves << [@row + i, @column + i]
      i += 1
    end
  end

  def upwards_diagonal
    i = 1
    while @row - i >= 0 && @column - i >= 0
      piece_coord = @array[@row - i][@column - i]
      if piece_coord.is_a?(Piece)
        break if piece_coord.piece_color == @piece_color

        unless piece_coord.piece_color == @piece_color
          @legal_moves << [@row - i, @column - i]
          break
        end
      end
      @legal_moves << [@row - i, @column - i]
      i += 1
    end
  end

  def downwards_anti_diagonal
    i = 1
    while @row + i <= 7 && @column - i >= 0
      piece_coord = @array[@row + i][@column - i]
      if piece_coord.is_a?(Piece)
        break if piece_coord.piece_color == @piece_color

        unless piece_coord.piece_color == @piece_color
          @legal_moves << [@row + i, @column - i]
          break
        end
      end
      @legal_moves << [@row + i, @column - i]
      i += 1
    end
  end

  def upwards_anti_diagonal
    i = 1
    while @row - i >= 0 && @column + i <= 7
      piece_coord = @array[@row - i][@column + i]
      if piece_coord.is_a?(Piece)
        break if piece_coord.piece_color == @piece_color

        unless piece_coord.piece_color == @piece_color
          @legal_moves << [@row - i, @column + i]
          break
        end
      end
      @legal_moves << [@row - i, @column + i]
      i += 1
    end
  end
end
