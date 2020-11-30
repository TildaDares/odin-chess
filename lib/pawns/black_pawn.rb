require_relative 'pawn'

class BlackPawn < Pawn
  attr_reader :symbol
  def initialize
    @symbol = '  ♟  '
  end
end
