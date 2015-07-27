class Board
  def initialize
    @board = [["w"]]
  end
  attr_accessor :board

  def place_ship(ship, x, y)
  	fail 'out of map!' if board[y-1][x-1] == nil
    fail "Ship already on that spot!" if board[y-1][x-1] != "w"
    board[y-1][x-1] = ship
  end

  def fire(x,y)
  	board[y-1][x-1] != "w" ? board[y-1][x-1].hit : 'miss'
  end

end