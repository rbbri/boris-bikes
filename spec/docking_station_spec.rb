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
    bike = Bike.new
    station.dock(bike)
    expect(station.bike).to eq bike
  end

  it 'raises an error when no bikes are docked' do
    expect { subject.release_bike }.to raise_error("No bikes available!")
  end

  it 'raises an error when the dock is already full' do
    station = subject
    station.dock(Bike.new)
    expect { station.dock(Bike.new) }.to raise_error("Dock full!")
  end


end
