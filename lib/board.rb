require 'colorize'
require_relative 'piece'
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
class Board
  def initialize
    populate_array
  end

  def populate_array
    array = Array.new(8) { Array.new(8) { '     ' } }
    0.upto(7) do |i|
      array[1][i] = BlackPawn.new
      array[6][i] = WhitePawn.new
    end
    array[0][0] = BlackRook.new
    array[7][0] = WhiteRook.new

    array[0][1] = BlackKnight.new
    array[7][1] = WhiteKnight.new

    array[0][2] = BlackBishop.new
    array[7][2] = WhiteBishop.new

    array[0][3] = BlackQueen.new
    array[7][3] = WhiteQueen.new

    array[0][4] = BlackKing.new
    array[7][4] = WhiteKing.new

    array[0][5] = BlackBishop.new
    array[7][5] = WhiteBishop.new

    array[0][6] = BlackKnight.new
    array[7][6] = WhiteKnight.new

    array[0][7] = BlackRook.new
    array[7][7] = WhiteRook.new

    @array = array
  end

  def color_board(row, column, chess_piece)
    if row.even?
      even_column_tiles(column, chess_piece)
    else
      odd_column_tiles(column, chess_piece)
    end
  end

  def print_board(array = @array)
    i = 8
    0.upto(7) do |j|
      print "#{i} #{color_board(j, 0, array[j][0])}#{color_board(j, 1, array[j][1])}#{color_board(j, 2, array[j][2])}#{color_board(j, 3, array[j][3])}#{color_board(j, 4, array[j][4])}#{color_board(j, 5, array[j][5])}#{color_board(j, 6, array[j][6])}#{color_board(j, 7, array[j][7])}\n"
      i -= 1
    end
    print "    a    b    c    d    e    f    g    h  \n"
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
end
