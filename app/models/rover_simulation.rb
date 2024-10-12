 class RoverSimulation
   attr_reader :rover, :boundry, :instruction_deserializer

   delegate :process_instruction, :status, to: :rover
   alias_method :results, :status

    def initialize(rover, boundry, instructions)
      @rover = rover
      @boundry = boundry
      @instruction_deserializer = InstructionDeserializer.new(instructions)
    end

    def process_instructions
      instruction_deserializer.each do |instruction|
        break if rover.lost?

        rover.process_instruction(instruction)
        rover.lost = true unless boundry.within_boundries?(rover.location)
      end
    end
 end
