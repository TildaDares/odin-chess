# frozen_string_literal: true

require_relative 'queen'
require 'colorize'
class BlackQueen < Queen
  attr_reader :symbol, :piece_color
  attr_accessor :row, :column
  def initialize(row, column)
    @symbol = '  ♛  '.black
    @row = row
    @column = column
    @piece_color = 'black'
  end

  def move(array)
    @array = array
    @possible_moves = {}
    queen_moves
    @possible_moves
  end

  private

  def queen_moves
    rook = BlackRook.new(@row, @column)
    bishop = BlackBishop.new(@row, @column)
    @possible_moves = rook.move(@array).merge(bishop.move(@array))
  end
end
