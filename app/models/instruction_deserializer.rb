class InstructionDeserializer
  include Enumerable
  INSTRUCTION_MAP = { 'F' => :forward, 'L' => :left, 'R' => :right }

  def initialize(instructions)
    @instructions = instructions
  end

  def each
    @instructions.each_char do |instruction_char|
      instruction = INSTRUCTION_MAP[instruction_char]
      yield instruction
    end
  end
end
