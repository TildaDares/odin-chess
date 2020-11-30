require_relative 'queen'
class WhiteQueen < Queen
  attr_reader :symbol
  def initialize
    @symbol = '  ♔  '
  end
end
