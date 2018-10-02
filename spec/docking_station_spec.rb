require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
end

describe DockingStation.new.release_bike do
  it { is_expected.to be_working }
end
