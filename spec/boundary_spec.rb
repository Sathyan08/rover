describe Boundry do
  let(:boundry) { Boundry.new(5, 5) }
  let(:location) { Location.new(0, 0) }

  describe "#initialize" do
    context "when the x_range is a range" do
      it "sets the x_range" do
        boundry = Boundry.new((0..5), 5)
        expect(boundry.x_range).to eq(0..5)
      end
    end

    context "when the x_range is not a range" do
      it "sets the x_range to a range" do
        expect(boundry.x_range).to eq(0..5)
      end
    end

    context "when the y_range is a range" do
      it "sets the y_range" do
        boundry = Boundry.new(5, (0..5))
        expect(boundry.y_range).to eq(0..5)
      end
    end

    context "when the y_range is not a range" do
      it "sets the y_range to a range" do
        expect(boundry.y_range).to eq(0..5)
      end
    end
  end

  describe "#within_boundries?" do
    context "when the location is within the boundries" do
      it "returns true" do
        expect(boundry.within_boundries?(location)).to be true
      end
    end

    context "when the location is outside the horizontal boundry" do
      let(:location) { Location.new(0, 6) }

      it "returns false" do
        expect(boundry.within_boundries?(location)).to be false
      end
    end

    context "when the location is outside the vertical boundry" do
      let(:location) { Location.new(6, 0) }

      it "returns false" do
        expect(boundry.within_boundries?(location)).to be false
      end
    end
  end
end
