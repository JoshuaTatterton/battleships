class Ship

  attr_accessor :status

  def set_location(x)
    @status = [x,"s"]
  end

  def hit_ship
  	status[1] = "h"
  end
  
end