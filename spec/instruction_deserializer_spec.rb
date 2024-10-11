describe InstructionDeserializer do
  let(:instructions) { "FFLFRFF" }
  let(:instruction_deserializer) { InstructionDeserializer.new(instructions) }

  describe "#each" do
    it "yields each instruction" do
      results = []
      instruction_deserializer.each do |instruction|
        results << instruction
      end

      expect(results).to eq(%i(forward forward left forward right forward forward))
    end
  end
end
