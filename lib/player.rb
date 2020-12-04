# frozen_string_literal: true

require 'colorize'
require 'pry'
# Player class
class Player
  attr_reader :name, :piece
  def initialize(name, piece)
    @name = name
    @piece = piece
    @@board = Board.new
  end

  def self.board=(value)
    @@board = value
  end

  def move
    @@board.print_board
    puts "#{@name} what piece would you like to play? ".green + directions
    piece_to_play = gets.chomp
    verify_user_input(piece_to_play)

    until @@board.check_game_board_pieces?(piece_to_play, @piece)
      puts 'Enter a valid move'.green
      piece_to_play = gets.chomp
      verify_user_input(piece_to_play)
    end
    piece_to_play = piece_to_play.split('-')
    puts "#{@name} moved her piece from #{piece_to_play[0].strip} to #{piece_to_play[1].strip}".yellow
    true
  end

  private

  def verify_user_input(input)
    while input.empty? || !(/\A[a-h][1-8]\s?\-\s?[a-h][1-8]\Z/i =~ input)
      puts 'Enter a valid piece'.green
      input = gets.chomp
    end
  end

  def directions
    "(e.g. a1-a3, d3 - e5) or enter 'save' to save game progress or 'quit' to quit".green
  end
end
