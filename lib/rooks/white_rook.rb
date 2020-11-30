require_relative 'rook'
class WhiteRook < Rook
  attr_reader :symbol
  def initialize
    @symbol = '  ♖  '
  end
end
