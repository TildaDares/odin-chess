require_relative 'pawn'
class WhitePawn < Pawn
  attr_reader :symbol
  def initialize
    @symbol = '  ♙  '
  end
end
