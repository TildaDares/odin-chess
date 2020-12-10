# frozen_string_literal: true
require_relative 'knight'
require 'colorize'
class BlackKnight < Knight
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♞  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end
end
