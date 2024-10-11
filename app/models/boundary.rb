class Boundry
  attr_reader :x_range, :y_range

  def initialize(x_range, y_range)
    if x_range.is_a?(Range)
      @x_range = x_range
    elsif x_range.is_a?(Integer)
      @x_range = (0..x_range)
    end

    if y_range.is_a?(Range)
      @y_range = y_range
    elsif y_range.is_a?(Integer)
      @y_range = (0..y_range)
    end
  end

  def within_boundries?(location)
    x_range.include?(location.x) && y_range.include?(location.y)
  end
end
