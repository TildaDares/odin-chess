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
    @@board.print_board(@piece)
    piece_to_play = move_user_piece
    piece_to_play = piece_to_play.split('-')
    puts "#{@name} moved her piece from #{piece_to_play[0].strip} to #{piece_to_play[1].strip}".yellow
    return false if game_over?

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

  def game_over?
    if @@board.checkmate?(opp_piece_color)
      puts 'Checkmate!'.red
      puts "#{@name} wins!".green
      true
    elsif @@board.stalemate?(opp_piece_color)
      puts 'Stalemate!'.red
      puts '1/2 - 1/2'.blue
      true
    else
      false
    end
  end

  def opp_piece_color
    @piece == 'white' ? 'black' : 'white'
  end

  def directions
    "(e.g. a1-a3, d3 - e5) or enter 'save' to save game progress or 'quit' to quit".green
  end
end
