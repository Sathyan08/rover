describe RoverTextFileInterpreter do
  let(:file_path) { "spec/fixtures/rover_instructions_test.txt" }
  let(:rover_text_file_interpreter) { RoverTextFileInterpreter.new(file_path) }

  describe "#process" do
    it "processes each line in the file" do
      results = []
      rover_text_file_interpreter.process do |result|
        results << result
      end

      expect(results).to eq(["(4, 4, E)", "(0, 4, W) LOST"])
    end
  end
end
