class InstructionDeserializer
  include Enumerable
  INSTRUCTION_MAP = { 'F' => :move, 'L' => :turn_left, 'R' => :turn_right }

  def initialize(instructions)
    @instructions = instructions
  end

  def each
    @instructions.each_char do |instruction_char|
      instruction = convert_to_instruction(instruction_char)
      yield instruction
    end
  end

  def convert_to_instruction(char)
    INSTRUCTION_MAP[char]
  end
end
