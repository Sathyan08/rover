class RoverTextFileInterpreter
  INSTRUCTIONS_DIRECTORY = 'app/data'
  INSTRUCTION_TEXT_FILES = Dir.entries(INSTRUCTIONS_DIRECTORY).select { |file| file.include?('rover_instructions') }.sort

  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def process
    boundry = nil
    File.open(file_path, 'r').each_with_index do |line, index|
      if index.zero?
        boundry = create_boundry(line.strip)
      else
        rover_string, instructions = line.strip.split(')').map(&:strip)

        rover = create_rover(rover_string)
        rover_simulation = RoverSimulation.new(rover, boundry, instructions)

        rover_simulation.process_instructions
        yield(rover_simulation.results)
      end
    end
  end

  private

  def create_boundry(line)
    x, y = line.strip.split(' ').map(&:to_i)
    Boundry.new(x, y)
  end

  def create_rover(rover_string)
    rover_string.gsub!('(', '')
    rover_chars = rover_string.split(', ')
    rover_coords = rover_chars[0..1].map(&:to_i)

    location = Location.new(*rover_coords)
    orientation = Orientation.new(rover_chars[2])
    Rover.new(location, orientation)
  end
end
