require_relative 'bishop'
require 'colorize'
class BlackBishop < Bishop
  attr_reader :symbol
  def initialize
    @symbol = '  ♝  '.black
  end
end
