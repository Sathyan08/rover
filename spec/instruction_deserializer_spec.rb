describe InstructionDeserializer do
  let(:instructions) { "FFLFRFF" }
  let(:instruction_deserializer) { InstructionDeserializer.new(instructions) }

  describe "#each" do
    it "yields each instruction" do
      results = []
      instruction_deserializer.each do |instruction|
        results << instruction
      end

      expect(results).to eq(%i(move move turn_left move turn_right move move))
    end
  end
end
