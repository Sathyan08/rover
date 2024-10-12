describe Rover do
  let(:rover) { Rover.new(location, orientation) }
  let(:location) { double }
  let(:orientation) { double(current: "north") }


  describe "#process_instruction" do
    let(:instructions) { [:move, :turn_left, :turn_left, :move, :turn_right] }
    let(:location) { Location.new(2, 3) }
    let(:orientation) { Orientation.new('north') }

    it "processes the instructions" do
      instructions.each { |instruction| rover.process_instruction(instruction) }

      expect(rover.location_current).to eq([2, 3])
      expect(rover.orientation_current).to eq('west')
    end
  end

  describe "status" do
    context "when the rover is not lost" do
      let(:location) { Location.new(1, 2) }
      let(:orientation) { Orientation.new('north') }

      it "returns the current location and orientation" do
        expect(rover.status).to eq("(1, 2, N)")
      end
    end

    context "when the rover is lost" do
      let(:location) { Location.new(1, 2) }
      let(:orientation) { Orientation.new('north') }

      before do
        rover.lost = true
      end

      it "returns the current location and orientation with 'LOST'" do
        expect(rover.status).to eq("(1, 2, N) LOST")
      end
    end
  end
end
