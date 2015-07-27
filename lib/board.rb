require_relative "ship"

class Board
  def initialize
    @board = [["w"]]
    @ships = []
  end
  attr_reader :ships
  attr_accessor :board

  def place_ship(ship, x, y)
  	fail 'out of map!' if board[y-1][x-1] == nil
    fail "Ship already on that spot!" if board[y-1][x-1] != "w"
    ship.set_location([x,y])
    @ships << ship
    board[y-1][x-1] = "s"
  end

  def fire(x,y)
  	board[y-1][x-1] == "s" ? hit(x,y) : 'miss'
  end

  def ship_checker(x,y)
    @ships.each {|s| (s.status == [x,y]) ? (return s) : "what?"}
  end

  def hit(x,y)
    (ship_checker(x,y))[0].hit_ship
    board[y-1][x-1] = "h"
  end

end