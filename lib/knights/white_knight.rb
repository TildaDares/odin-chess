require_relative 'knight'
class WhiteKnight < Knight
  attr_reader :symbol, :row, :column, :piece_color
  def initialize(row, column)
    @row = row
    @column = column
    @symbol = '  ♘  '
    @piece_color = 'white'
  end
end
