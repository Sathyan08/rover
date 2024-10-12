require 'active_model'

class Rover
  include ActiveModel::Model
  VALID_INSTRUCTIONS = %i[move turn_left turn_right].freeze

  attr_reader :location, :orientation, :last_known_location
  attr_accessor :lost

  delegate :move, to: :location
  delegate :turn_left, :turn_right, to: :orientation

  delegate :to_a, to: :location, prefix: true
  delegate :current, to: :orientation, prefix: true
  delegate :initial, to: :orientation, prefix: true

  alias_method :current_location, :location_to_a
  alias_method :current_orientation, :orientation_current
  alias_method :lost?, :lost

  def initialize(location, orientation)
    @location = location
    @last_known_location = location.dup

    @orientation = orientation
    @lost = false
  end

  def move
    return if lost?

    @last_known_location = location.dup
    movement_instruction = "move_" + orientation_current.to_s
    location.send(movement_instruction)
  end

  def process_instruction(instruction)
    raise ArgumentError unless VALID_INSTRUCTIONS.include?(instruction.to_sym)
    public_send(instruction)
  end

  def status
    location_status = lost? ? last_known_location : location
    status_string = "(#{location_status.to_a.join(', ')}, #{orientation_initial})"
    status_string += " LOST" if lost?

    status_string
  end
end
