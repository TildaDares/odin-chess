require 'colorize'
require_relative 'piece'
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
  attr_reader :array
  def initialize
    populate_array
  end

  def populate_array
    array = Array.new(8) { Array.new(8) { '     ' } }
    0.upto(7) do |i|
      array[6][i] = BlackPawn.new(6, i)
      array[1][i] = WhitePawn.new(1, i)
    end
    array[7][0] = BlackRook.new(7, 0)
    array[0][0] = WhiteRook.new(0, 0)

    array[7][1] = BlackKnight.new(7, 1)
    array[0][1] = WhiteKnight.new(0, 1)

    array[7][2] = BlackBishop.new(7, 2)
    array[0][2] = WhiteBishop.new(0, 2)

    array[7][3] = BlackQueen.new(7, 3)
    array[0][3] = WhiteQueen.new(0, 3)

    array[7][4] = BlackKing.new(7, 4)
    array[0][4] = WhiteKing.new(0, 4)

    array[7][5] = BlackBishop.new(7, 5)
    array[0][5] = WhiteBishop.new(0, 5)

    array[7][6] = BlackKnight.new(7, 6)
    array[0][6] = WhiteKnight.new(0, 6)

    array[7][7] = BlackRook.new(7, 7)
    array[0][7] = WhiteRook.new(0, 7)

    @array = array
  end

  def color_board(row, column, chess_piece, _row_except, _col_except)
    if row.even?
      even_column_tiles(column, chess_piece)
    else
      odd_column_tiles(column, chess_piece)
    end
  end

  def print_board(array = @array)
    print "    a    b    c    d    e    f    g    h  \n"
    7.downto(0) do |j|
      print "#{j + 1} #{color_board(j, 0, array[j][0])}#{color_board(j, 1, array[j][1])}#{color_board(j, 2, array[j][2])}#{color_board(j, 3, array[j][3])}#{color_board(j, 4, array[j][4])}#{color_board(j, 5, array[j][5])}#{color_board(j, 6, array[j][6])}#{color_board(j, 7, array[j][7])} #{j + 1}\n"
    end
    print "    a    b    c    d    e    f    g    h  \n"
  end

  def even_column_tiles(column, chess_piece)
    piece = chess_piece.is_a?(Piece) ? chess_piece.symbol : chess_piece
    if column.even?
      piece.on_light_black
    else
      piece.on_light_white
    end
  end

  def odd_column_tiles(column, chess_piece)
    piece = chess_piece.is_a?(Piece) ? chess_piece.symbol : chess_piece
    if column.odd?
      piece.on_light_black
    else
      piece.on_light_white
    end
  end

  def check_game_board_pieces?(piece_to_play, piece_color)
    copied_array = Marshal.load Marshal.dump(@array)
    coord = piece_to_play.downcase
    row, column = change_alphabet_to_array(coord)
    return false unless @array[row][column].is_a?(Piece)

    if @array[row][column].piece_color == piece_color
      @array[row][column].move(@array)
      @valid_squares = @array[row][column].legal_moves
      print_board
      if @valid_squares.empty?
        puts 'There are no moves to make from this square'
        return false
      else
        return true
      end
    end
    puts "You're playing from the wrong side of the board"
    false
  end

  def check_for_valid_square?(piece_to_play, coord, valid_squares = @valid_squares)
    piece_to_play = piece_to_play.downcase unless piece_to_play.is_a?(Array)
    coord = coord.downcase unless coord.is_a?(Array)
    source_row, source_column = change_alphabet_to_array(piece_to_play)
    row, column = change_alphabet_to_array(coord)
    if valid_squares[[row, column]]
      @array[row][column] = @array[source_row][source_column]
      @array[row][column].row = source_row
      @array[row][column].column = source_column
      @array[source_row][source_column] = '     '

      @array[row][column].symbol.on_light_yellow
      @array[source_row][source_column].on_light_yellow
      print_board
      return true

    end
    false
  end
end
# board = Board.new
# knight = board.array[3][3] = WhiteKnight.new(3, 3)
# board.array[5][1] = BlackQueen.new(5, 1)
# p board.array[5][1]
# board.array[5][1].move(board.array)
# p board.array[5][1].legal_moves
# p board.print_board
