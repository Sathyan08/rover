class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def current
    [@x, @y]
  end

  def move_north
    @y += 1
  end

  def move_east
    @x += 1
  end

  def move_south
    @y -= 1
  end

  def move_west
    @x -= 1
  end
end
