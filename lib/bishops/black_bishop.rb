# frozen_string_literal: true
require_relative 'bishop'
require 'colorize'
class BlackBishop < Bishop
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♝  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end
end
