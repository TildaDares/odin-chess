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
    puts "#{@name} is in CHECK!".red if @@board.check?(@piece)
    @@board.print_board
    piece_to_play = move_user_piece
    piece_to_play = piece_to_play.split('-')
    puts "#{@name} moved her piece from #{piece_to_play[0].strip} to #{piece_to_play[1].strip}".yellow
    true
  end

  private

  def move_user_piece
    piece_to_play = nil
    loop do
      puts "#{@name} what piece would you like to play? ".green + directions
      piece_to_play = gets.chomp
      while piece_to_play.empty? || !(/\A[a-h][1-8]\s?\-\s?[a-h][1-8]\Z/i =~ piece_to_play)
        puts 'Enter a valid piece'.green
        piece_to_play = gets.chomp
      end
      break if @@board.check_game_board_pieces?(piece_to_play, @piece)
    end
    piece_to_play
  end

  def directions
    "(e.g. a1-a3, d3 - e5) or enter 'save' to save game progress or 'quit' to quit".green
  end
end
