class Orientation
  DIRECTIONS = %w(north east south west)
  INITIAL_DIRECTION_MAP = { 'N' => 'north', 'E' => 'east', 'S' => 'south', 'W' => 'west' }
  DIRECTION_INITIAL_MAP = INITIAL_DIRECTION_MAP.invert

  def initialize(starting_direction)
    starting_direction = INITIAL_DIRECTION_MAP.fetch(starting_direction, starting_direction)
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

  def initial
    DIRECTION_INITIAL_MAP[current]
  end
end
