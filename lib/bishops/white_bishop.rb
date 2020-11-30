require_relative 'bishop'

class WhiteBishop < Bishop
  attr_reader :symbol
  def initialize
    @symbol = '  ♗  '
  end
end
