require_relative 'knight'
class WhiteKnight < Knight
  attr_reader :symbol
  def initialize
    @symbol = '  ♘  '
  end
end
