describe Orientation do
  let(:starting_direction) { 'N' }
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
          expect(orientation.current).to eq('W')

          orientation.turn_left
          expect(orientation.current).to eq('S')

          orientation.turn_left
          expect(orientation.current).to eq('E')

          orientation.turn_left
          expect(orientation.current).to eq('N')
        end

        it "returns the correct direction after multiple turns" do
          orientation.turn_left(7)
          expect(orientation.current).to eq('E')
        end
      end

      context "after right turns" do
        it "returns the correct direction" do
          orientation.turn_right
          expect(orientation.current).to eq('E')

          orientation.turn_right
          expect(orientation.current).to eq('S')

          orientation.turn_right
          expect(orientation.current).to eq('W')

          orientation.turn_right
          expect(orientation.current).to eq('N')
        end

        it "returns the correct direction after multiple turns" do
          orientation.turn_right(7)
          expect(orientation.current).to eq('W')
        end
      end
    end
  end
end
