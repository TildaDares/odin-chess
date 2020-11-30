require_relative 'knight'
require 'colorize'
class BlackKnight < Knight
  attr_reader :symbol
  def initialize
    @symbol = '  ♞  '.black
  end
end
