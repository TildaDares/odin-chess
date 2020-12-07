# frozen_string_literal: true

require 'colorize'
require_relative 'populate_chess_array'
require_relative 'convert_chess_notations'
require_relative 'bishops/white_bishop'
require_relative 'bishops/black_bishop'
require_relative 'kings/white_king'
require_relative 'kings/black_king'
require_relative 'queens/white_queen'
require_relative 'queens/black_queen'
require_relative 'pawns/white_pawn'
require_relative 'pawns/black_pawn'
require_relative 'knights/white_knight'
require_relative 'knights/black_knight'
require_relative 'rooks/white_rook'
require_relative 'rooks/black_rook'
require 'pry'
class Board
  include ConvertChessNotations
  include PopulateChessArray
  attr_reader :array
  def initialize
    populate_array
  end

  def print_board(piece_color)
    print "    a    b    c    d    e    f    g    h  \n"
    if piece_color == 'white'
      7.downto(0) { |row| print_symbols(row) }
    else
      0.upto(7) { |row| print_symbols(row) }
    end
    print "    a    b    c    d    e    f    g    h  \n"
  end

  def check_game_board_pieces?(piece_to_play, piece_color)
    piece_to_play = piece_to_play.split('-')
    source_coord = piece_to_play[0].downcase.strip
    dest_coord = piece_to_play[1].downcase.strip
    row, column = change_alphabet_to_array(source_coord)
    return false unless @array[row][column].is_a?(Piece)

    if @array[row][column].piece_color == piece_color
      possible_moves = @array[row][column].move(@array)
      @valid_squares = check_for_legal_moves(possible_moves, piece_color, source_coord)
      return true if check_for_valid_square?(source_coord, dest_coord)

      puts 'That move is invalid'.red
      return false
    end
    puts "You're playing from the wrong side of the board".red
    false
  end

  def check?(piece_color, array = @array)
    king = look_for_king(piece_color)
    king_row = king.row
    king_col = king.column
    array.each_with_index do |subarray, _row|
      subarray.each_with_index do |sub_sub_array, _column|
        next unless sub_sub_array.is_a?(Piece)

        next if sub_sub_array.piece_color == piece_color

        possible_moves = sub_sub_array.move(array)
        return true if possible_moves[[king_row, king_col]]
      end
    end
    false
  end

  def checkmate?(piece_color)
    check?(piece_color) && no_moves_left?(piece_color)
  end

  def stalemate?(piece_color)
    !check?(piece_color) && no_moves_left?(piece_color)
  end

  private

  def check_for_legal_moves(possible_moves, piece_color, coord)
    row, column = change_alphabet_to_array(coord)
    dup_possible_moves = Marshal.load Marshal.dump(possible_moves)
    king = look_for_king(piece_color)
    dup_king = Marshal.load Marshal.dump(king)

    dup_possible_moves.each do |moves_key, _moves_value|
      dup_array = Marshal.load Marshal.dump(@array)
      chess_piece = dup_array[moves_key[0]][moves_key[1]] = dup_array[row][column].class.new(moves_key[0], moves_key[1])
      change_king_coord(moves_key[0], moves_key[1], king) if chess_piece.is_a?(king.class)
      dup_array[row][column] = '     '
      possible_moves.delete(moves_key) if check?(piece_color, dup_array)
    end
    king = @array[dup_king.row][dup_king.column]
    possible_moves
  end

  def change_king_coord(row, column, king)
    king.row = row
    king.column = column
  end

  def look_for_king(piece_color)
    piece_color == 'white' ? @white_king : @black_king
  end

  def no_moves_left?(piece_color)
    @array.each_with_index do |subarray, row|
      subarray.each_with_index do |sub_sub_array, column|
        next unless sub_sub_array.is_a?(Piece)

        next unless sub_sub_array.piece_color == piece_color

        possible_moves = sub_sub_array.move(@array)
        @legal_moves = check_for_legal_moves(possible_moves, piece_color, [row, column])
        return false unless @legal_moves.empty?
      end
    end
    true
  end

  def print_symbols(row)
    print "#{row + 1} #{color_board(row, 0, @array[row][0])}#{color_board(row, 1, @array[row][1])}"
    print "#{color_board(row, 2, @array[row][2])}#{color_board(row, 3, @array[row][3])}"
    print "#{color_board(row, 4, @array[row][4])}#{color_board(row, 5, @array[row][5])}"
    print "#{color_board(row, 6, @array[row][6])}#{color_board(row, 7, @array[row][7])} #{row + 1}\n"
  end

  def even_column_tiles(column, chess_piece)
    piece = chess_piece.is_a?(Piece) ? chess_piece.symbol : chess_piece
    if column.even?
      piece.on_light_black
    else
      piece.on_green
    end
  end

  def odd_column_tiles(column, chess_piece)
    piece = chess_piece.is_a?(Piece) ? chess_piece.symbol : chess_piece
    if column.odd?
      piece.on_light_black
    else
      piece.on_green
    end
  end

  def color_board(row, column, chess_piece)
    if row.even?
      even_column_tiles(column, chess_piece)
    else
      odd_column_tiles(column, chess_piece)
    end
  end

  def check_for_valid_square?(source_coord, dest_coord)
    source_row, source_column = change_alphabet_to_array(source_coord)
    row, column = change_alphabet_to_array(dest_coord)
    if @valid_squares[[row, column]]
      @array[row][column] = @array[source_row][source_column]
      @array[source_row][source_column] = '     '
      @array[row][column].row = row
      @array[row][column].column = column

      return true
    end
    false
  end
end
