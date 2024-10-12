class Orientation
  DIRECTIONS = %w(north east south west)

  def initialize(starting_direction)
    @current_index = DIRECTIONS.index(starting_direction)
  end

  def current
    DIRECTIONS[@current_index]
  end

  def turn_left(turns = 1)
    @current_index = (@current_index - turns) % DIRECTIONS.length
  end

  def turn_right(turns = 1)
    @current_index = (@current_index + turns) % DIRECTIONS.length
  end

  def current_direction_initial
    DIRECTIONS[@current_index][0].upcase
  end
end
