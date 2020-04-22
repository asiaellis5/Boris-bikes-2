require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do
  let(:van){described_class.new}
  let(:bike){ double(:bike)}


  describe "#pick_up_docking" do
    it "picks up a broken bike from a docking station" do
      allow(bike).to receive(:working?).and_return false
      subject.pick_up(bike)
      expect(subject.bikes.length).to eq 1
    end
  end

  describe "#pick_up_garage" do
    it "picks up a fixed bike from the garage" do
      allow(bike).to receive(:working?).and_return true
      subject.pick_up(bike)
      expect(subject.bikes.length).to eq 1
    end
  end

  describe "#drop_off_garage" do
    it "drops off a bike" do 
      allow(bike).to receive(:working?).and_return true
      subject.pick_up(bike)
      subject.drop_off
      expect(subject.bikes.length).to eq 0
    end
  end

  describe "#drop_off_docking" do
    it "drops off a bike" do 
      allow(bike).to receive(:working?).and_return true
      subject.pick_up(bike)
      subject.drop_off
      expect(subject.bikes.length).to eq 0
    end
  end

  it_behaves_like BikeContainer
end