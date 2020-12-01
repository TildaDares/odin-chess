require_relative 'knight'
class WhiteKnight < Knight
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @row = row
    @column = column
    @symbol = '  ♘  '
    @piece_color = 'white'
  end
end
