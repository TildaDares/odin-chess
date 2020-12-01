require_relative 'knight'
class WhiteKnight < Knight
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @row = row
    @column = column
    @symbol = '  ♘  '
  end
end
