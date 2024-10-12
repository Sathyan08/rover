require 'active_model'

class Rover
  include ActiveModel::Model
  VALID_INSTRUCTIONS = %i[move turn_left turn_right].freeze

  attr_reader :location, :orientation
  attr_accessor :lost

  delegate :move, to: :location
  delegate :turn_left, :turn_right, to: :orientation

  delegate :current, to: :location, prefix: true
  delegate :current, to: :orientation, prefix: true

  delegate :current_direction_initial, to: :orientation

  alias_method :current_location, :location_current
  alias_method :current_orientation, :orientation_current
  alias_method :lost?, :lost

  def initialize(location, orientation)
    @location = location
    @orientation = orientation
    @lost = false
  end

  def move
    movement_instruction = "move_" + orientation_current.to_s
    location.send(movement_instruction)
  end

  def process_instruction(instruction)
    raise ArgumentError unless VALID_INSTRUCTIONS.include?(instruction.to_sym)
    public_send(instruction)
  end

  def status
    status_string = "(#{current_location.join(', ')}, #{current_direction_initial})"
    status_string += " LOST" if lost?
    status_string
  end
end
