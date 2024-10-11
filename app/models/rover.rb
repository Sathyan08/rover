require 'active_model'

class Rover
  include ActiveModel::Model

  attr_reader :location, :orientation
  delegate :move, to: :location
  delegate :turn_left, :turn_right, to: :orientation

  delegate :current, to: :location, prefix: true
  delegate :current, to: :orientation, prefix: true

  alias_method :process_instruction, :public_send

  def initialize(location, orientation)
    @location = location
    @orientation = orientation
  end

  def move
    movement_instruction = "move_" + orientation_current.to_s
    location.send(movement_instruction)
  end
end
