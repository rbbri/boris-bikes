require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike that should be working' do
    station = subject
    bike = Bike.new
    station.dock(bike)
    expect(station.release_bike).to be_working
  end

  it { is_expected.to respond_to :dock }

  it 'displays a message when a bike is docked' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq "#{bike} successfully docked"
  end

  it 'show which bikes are docked' do
    station = DockingStation.new
    bike1 = Bike.new
    bike2 = Bike.new
    bike3 = Bike.new
    station.dock(bike1)
    station.dock(bike2)
    station.dock(bike3)
    expect(station.bikes).to eq [bike1, bike2, bike3]
  end

  it 'raises an error when no bikes are docked' do
    dock = DockingStation.new
    expect { dock.release_bike }.to raise_error("No bikes available!")
  end
end
