# frozen_string_literal: true

# Player class
class Player
  attr_reader :name, :piece
  def initialize(name, piece)
    @name = name
    @piece = piece
    @@board = Board.new
  end

  def self.set_board=(value)
    @@board = value
  end

  def move
    @@board.print_board
    puts "#{@name} what piece would you like to play? " + directions
    piece_to_play = gets.chomp
    return false unless verify_user_input(piece_to_play)

    until @@board.check_game_board_pieces?(piece_to_play, @piece)
      puts 'That piece cannot be reached'
      puts 'Enter a valid piece'
      piece_to_play = gets.chomp
      return false unless verify_user_input(piece_to_play)
    end
    move_to_square(piece_to_play)
  end

  def move_to_square(piece_to_play)
    puts "#{@name} where would you like to move to? " + directions
    square_to_move_to = gets.chomp
    return false unless verify_user_input(square_to_move_to)

    until @@board.check_for_valid_square?(piece_to_play, square_to_move_to)
      puts 'That square cannot be reached'
      puts 'Enter a valid square'
      square_to_move_to = gets.chomp
      return false unless verify_user_input(square_to_move_to)
    end
    true
  end

  private

  def verify_user_input(input)
    while input.empty? || !(/^[a-h][1-8]$/i =~ input)
      puts 'Enter a valid piece'
      input = gets.chomp
    end
    true
  end

  def directions
    "(e.g. a1, d3, d7) or enter 'save' to save game progress or 'quit' to quit"
  end
end
