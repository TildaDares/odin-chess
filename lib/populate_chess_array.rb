# frozen_string_literal: true

module PopulateChessArray
  def populate_array
    @array = Array.new(8) { Array.new(8) { '     ' } }
    bishops_on_board
    rooks_on_board
    knights_on_board
    pawns_on_board
    kings_on_board
    queens_on_board
  end

  private

  def bishops_on_board
    @array[7][5] = BlackBishop.new(7, 5)
    @array[0][5] = WhiteBishop.new(0, 5)
    @array[7][2] = BlackBishop.new(7, 2)
    @array[0][2] = WhiteBishop.new(0, 2)
  end

  def rooks_on_board
    @array[7][7] = BlackRook.new(7, 7)
    @array[0][7] = WhiteRook.new(0, 7)
    @array[7][0] = BlackRook.new(7, 0)
    @array[0][0] = WhiteRook.new(0, 0)
  end

  def knights_on_board
    @array[7][6] = BlackKnight.new(7, 6)
    @array[0][6] = WhiteKnight.new(0, 6)
    @array[7][1] = BlackKnight.new(7, 1)
    @array[0][1] = WhiteKnight.new(0, 1)
  end

  def kings_on_board
    @black_king = array[7][4] = BlackKing.new(7, 4)
    @white_king = array[0][4] = WhiteKing.new(0, 4)
  end

  def queens_on_board
    @array[7][3] = BlackQueen.new(7, 3)
    @array[0][3] = WhiteQueen.new(0, 3)
  end

  def pawns_on_board
    0.upto(7) do |i|
      @array[6][i] = BlackPawn.new(6, i)
      @array[1][i] = WhitePawn.new(1, i)
    end
  end
end
