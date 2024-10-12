class Boundry
  attr_reader :x_range, :y_range

  def initialize(x_range, y_range)
    @x_range = set_range(x_range)
    @y_range = set_range(y_range)
  end

  def within_boundries?(location)
    x_range.include?(location.x) && y_range.include?(location.y)
  end

  private

  def set_range(range)
    range.is_a?(Range) ? range : (0..range)
  end
end
