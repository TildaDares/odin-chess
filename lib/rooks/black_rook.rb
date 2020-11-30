require_relative 'rook'
require 'colorize'
class BlackRook < Rook
  attr_reader :symbol
  def initialize
    @symbol = '  ♜  '.black
  end
end
