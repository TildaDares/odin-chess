# frozen_string_literal: true
require_relative 'bishop'

class WhiteBishop < Bishop
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♗  '
    @row = row
    @column = column
    @piece_color = 'white'
  end
end
