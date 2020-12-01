require_relative 'king'
require 'colorize'

class BlackKing < King
  attr_reader :symbol, :row, :column
  def initialize(row, column)
    @symbol = '  ♚  '.black
    @row = row
    @column = column    
  end
end
