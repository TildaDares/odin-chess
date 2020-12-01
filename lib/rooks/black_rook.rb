require_relative 'rook'
require 'colorize'
class BlackRook < Rook
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @row = row
    @column = column
    @symbol = '  ♜  '.black
  end
end
