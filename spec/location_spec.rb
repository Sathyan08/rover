describe Location do
  let(:starting_location) { [0, 0] }
  let(:location) { Location.new(*starting_location) }

  describe "#to_a" do
    context "when the location is initialized" do
      it "returns the starting location" do
        expect(location.to_a).to eq(starting_location)
      end
    end

    context "after moves" do
      it "returns the correct location" do
        location.move_north
        expect(location.to_a).to eq([0, 1])

        location.move_east
        expect(location.to_a).to eq([1, 1])

        location.move_south
        expect(location.to_a).to eq([1, 0])

        location.move_west
        expect(location.to_a).to eq([0, 0])
      end

      it "returns the correct location after multiple moves" do
        location.move_north(7)
        expect(location.to_a).to eq([0, 7])

        location.move_east(3)
        expect(location.to_a).to eq([3, 7])

        location.move_south(2)
        expect(location.to_a).to eq([3, 5])

        location.move_west(4)
        expect(location.to_a).to eq([-1, 5])
      end
    end
  end
end
