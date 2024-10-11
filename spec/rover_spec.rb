describe Rover do
  let(:rover) { Rover.new(location, orientation) }
  let(:location) { double }
  let(:orientation) { double(current: "north") }

  describe "#initialize" do
    it "sets the location" do
      expect(rover.location).to eq(location)
    end

    it "sets the orientation" do
      expect(rover.orientation).to eq(orientation)
    end
  end

  describe "#move" do
    it "moves the rover" do
      expect(location).to receive(:move_north)
      rover.move
    end
  end

  describe "#turn_left" do
    it "turns the rover left" do
      expect(orientation).to receive(:turn_left)
      rover.turn_left
    end
  end

  describe "#turn_right" do
    it "turns the rover right" do
      expect(orientation).to receive(:turn_right)
      rover.turn_right
    end
  end

  describe "#location_current" do
    it "returns the current location" do
      expect(location).to receive(:current)
      rover.location_current
    end
  end

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
end
