require_relative 'bishop'

class WhiteBishop < Bishop
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♗  '
    @row = row
    @column = column
  end
end
