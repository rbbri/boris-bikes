require "docking_station"

describe DockingStation do
  describe "should respond to release bike method" do
    it { expect(DockingStation.new).to respond_to(:release_bike) }
  end
end
