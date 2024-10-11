describe Orientation do
  let(:starting_direction) { 'north' }
  let(:orientation) { Orientation.new(starting_direction) }

  describe "#current" do
    context "when the orientation is initialized" do
      it "returns the starting direction" do
        expect(orientation.current).to eq(starting_direction)
      end
    end

    context "after turns" do
      context "after left turns" do
        it "returns the correct direction" do
          orientation.turn_left
          expect(orientation.current).to eq('west')

          orientation.turn_left
          expect(orientation.current).to eq('south')

          orientation.turn_left
          expect(orientation.current).to eq('east')

          orientation.turn_left
          expect(orientation.current).to eq('north')
        end

        it "returns the correct direction after multiple turns" do
          orientation.turn_left(7)
          expect(orientation.current).to eq('east')
        end
      end

      context "after right turns" do
        it "returns the correct direction" do
          orientation.turn_right
          expect(orientation.current).to eq('east')

          orientation.turn_right
          expect(orientation.current).to eq('south')

          orientation.turn_right
          expect(orientation.current).to eq('west')

          orientation.turn_right
          expect(orientation.current).to eq('north')
        end

        it "returns the correct direction after multiple turns" do
          orientation.turn_right(7)
          expect(orientation.current).to eq('west')
        end
      end
    end
  end
end
