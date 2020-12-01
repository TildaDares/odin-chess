require './lib/piece'
class Bishop < Piece
  attr_reader :legal_moves
  def move; end

  private

  def downwards_diagonal
    i = 1
    while @row + i <= 7 && @column + i <= 7
      break if (@piece & @array[@row + i][@column + i].split('')).any?

      if (@opponent_piece & @array[@row + i][@column + i].split('')).any?
        @green_square_array << [@row + i, @column + i]
        break
      end
      @green_square_array << [@row + i, @column + i]
      i += 1
    end
  end

  def upwards_diagonal
    i = 1
    while @row - i >= 0 && @column - i >= 0
      break if (@piece & @array[@row - i][@column - i].split('')).any?

      if (@opponent_piece & @array[@row - i][@column - i].split('')).any?
        @green_square_array << [@row - i, @column - i]
        break
      end
      @green_square_array << [@row - i, @column - i]
      i += 1
    end
  end

  def downwards_anti_diagonal
    i = 1
    while @row + i <= 7 && @column - i >= 0
      break if (@piece & @array[@row + i][@column - i].split('')).any?

      if (@opponent_piece & @array[@row + i][@column - i].split('')).any?
        @green_square_array << [@row + i, @column - i]
        break
      end
      @green_square_array << [@row + i, @column - i]
      i += 1
    end
  end

  def upwards_anti_diagonal
    i = 1
    while @row - i >= 0 && @column + i <= 7
      break if (@piece & @array[@row - i][@column + i].split('')).any?

      if (@opponent_piece & @array[@row - i][@column + i].split('')).any?
        @green_square_array << [@row - i, @column + i]
        break
      end
      @green_square_array << [@row - i, @column + i]
      i += 1
    end
  end
end
