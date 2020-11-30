require_relative 'king'
class WhiteKing < King
  attr_reader :symbol
  def initialize
    @symbol =  '  ♔  '
  end
end
