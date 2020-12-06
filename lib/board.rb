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

  def print_board(array = @array)
    print "    a    b    c    d    e    f    g    h  \n"
    7.downto(0) do |j|
      print "#{j + 1} #{color_board(j, 0, array[j][0])}#{color_board(j, 1, array[j][1])}"
      print "#{color_board(j, 2, array[j][2])}#{color_board(j, 3, array[j][3])}"
      print "#{color_board(j, 4, array[j][4])}#{color_board(j, 5, array[j][5])}"
      print "#{color_board(j, 6, array[j][6])}#{color_board(j, 7, array[j][7])} #{j + 1}\n"
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
      @valid_squares = check_for_legal_moves(possible_moves, @array, piece_color, source_coord)
      if check_for_valid_square?(source_coord, dest_coord)
        return true
      else
        puts 'That move is invalid'.red
        return false
      end
    end
    puts "You're playing from the wrong side of the board".red
    false
  end

  def check?(piece_color, array = @array)
    king_row, king_col = look_for_king(piece_color)
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

  private

  def check_for_legal_moves(possible_moves, array, piece_color, coord)
    row, column = change_alphabet_to_array(coord)
    dup_possible_moves = Marshal.load Marshal.dump(possible_moves)

    dup_possible_moves.each do |moves_key, _moves_value|
      dup_array = Marshal.load Marshal.dump(array)
      dup_array[moves_key[0]][moves_key[1]] = dup_array[row][column].class.new(moves_key[0], moves_key[1])
      dup_array[row][column] = '     '
      possible_moves.delete(moves_key) if check?(piece_color, dup_array)
    end
    possible_moves
  end

  def look_for_king(piece_color)
    if piece_color == 'white'
      [@white_king.row, @white_king.column]
    else
      [@black_king.row, @black_king.column]
    end
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

    @black_king = array[7][4] = BlackKing.new(7, 4)
    @white_king = array[0][4] = WhiteKing.new(0, 4)

    array[7][5] = BlackBishop.new(7, 5)
    array[0][5] = WhiteBishop.new(0, 5)

    array[7][6] = BlackKnight.new(7, 6)
    array[0][6] = WhiteKnight.new(0, 6)

    array[7][7] = BlackRook.new(7, 7)
    array[0][7] = WhiteRook.new(0, 7)

    @array = array
  end

  def color_board(row, column, chess_piece)
    if row.even?
      even_column_tiles(column, chess_piece)
    else
      odd_column_tiles(column, chess_piece)
    end
  end

  def check_for_valid_square?(source_coord, dest_coord, valid_squares = @valid_squares)
    source_row, source_column = change_alphabet_to_array(source_coord)
    row, column = change_alphabet_to_array(dest_coord)
    if valid_squares[[row, column]]
      @array[row][column] = @array[source_row][source_column]
      @array[source_row][source_column] = '     '
      @array[row][column].row = row
      @array[row][column].column = column

      return true

    end
    false
  end

  def opp_piece_color(piece_color)
    piece_color == 'white' ? 'black' : 'white'
  end
end
