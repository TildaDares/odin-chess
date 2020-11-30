require_relative 'king'
require 'colorize'

class BlackKing < King
  attr_reader :symbol
  def initialize
    @symbol = '  ♚  '.black
  end
end
