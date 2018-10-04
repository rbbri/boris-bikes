require "docking_station"
#
describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to :dock }

  describe '#release_bike' do
    it 'raises an error when no bikes are docked' do
      expect { subject.release_bike }.to raise_error("No bikes available!")
    end

    it 'releases a bike that should be working' do
      station = subject
      bike = Bike.new
      station.dock(bike)
      expect(station.release_bike).to be_working
    end

  end

  describe '#dock' do
    it 'displays a message when a bike is docked' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq "#{bike} successfully docked"
    end

    it 'raises an error when the dock is already full' do
      station = subject
      station.capacity.times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error("Dock full!")
    end

    it 'allows a user to report a broken bike when they return it' do
      station = DockingStation.new
      bike = Bike.new
      station.dock(bike, true)
      expect(station.bikes[0].working?).to eq false
    end

    it "doesn't release broken bikes" do
      station = DockingStation.new
      bike_broken = Bike.new
      station.dock(bike_broken, true)
      bike_working = Bike.new
      station.dock(bike_working, false)
      second_bike_broken = Bike.new
      station.dock(second_bike_broken, true)
      released_bike = station.release_bike
      expect(released_bike).to eq bike_working
    end

  end

  it 'should have a default capacity of 20' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it 'sets a capacity when initialized' do
    cap = 30
    station = DockingStation.new(cap)
    expect(station.capacity).to eq cap
  end


end
