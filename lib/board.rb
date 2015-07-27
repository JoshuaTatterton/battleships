class Board
  def initialize
    @board = [["w"]]
  end
  attr_accessor :board

  def place_ship(ship, x, y)
  	fail 'out of map!' if board[y-1][x-1] == nil
    board[y-1][x-1] = ship
  end
end