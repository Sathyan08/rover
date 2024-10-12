describe RoverSimulation do
  let(:instructions) { "FLLFR" }

  let(:location) { Location.new(2, 3) }
  let(:orientation) { Orientation.new('north') }

  let(:rover) { Rover.new(location, orientation) }
  let(:boundry) { Boundry.new(4, 8) }

  let(:rover_simulation) { RoverSimulation.new(rover, boundry, instructions) }

  describe "#process_instructions" do
    it "processes each instruction" do
      rover_simulation.process_instructions
      expect(rover_simulation.results).to eq("(2, 3, W)")
    end

    context "when the rover is lost" do
      let(:instructions) { "FFRLF" }
      let(:location) { Location.new(1, 0) }
      let(:orientation) { Orientation.new('south') }

      it "stops processing instructions" do
        rover_simulation.process_instructions
        expect(rover_simulation.results).to eq("(1, 0, S) LOST")
      end
    end
  end
end
