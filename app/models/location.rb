class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def current
    [@x, @y]
  end

  alias_method :to_a, :current

  def move_north(num_moves = 1)
    @y += num_moves
  end

  def move_east(num_moves = 1)
    @x += num_moves
  end

  def move_south(num_moves = 1)
    @y -= num_moves
  end

  def move_west(num_moves = 1)
    @x -= num_moves
  end

  def dup
    self.class.new(x, y)
  end
end
