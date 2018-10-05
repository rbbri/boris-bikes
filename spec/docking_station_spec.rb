require "docking_station"
require 'pry'
#
describe DockingStation do

  let(:bike) { double(:bike, working?: true) }
  let(:broken_bike) { double(:bike, working?: false) }
  let(:random_bike) { double(:bike, working?: [true, false].sample) }

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to :dock }

  describe '#release_bike' do
    it 'lets the user know when no bikes are docked' do
      expect(subject.release_bike).to eq("No bikes available!")
    end

    it 'releases a bike that should be working' do
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

  end

  describe '#dock' do
    it 'displays a message when a bike is docked' do
      expect(subject.dock(bike)).to eq "#{bike} successfully docked"
    end

    it 'raises an error when the dock is already full' do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error("Dock full!")
    end

    it 'allows a user to report a broken bike when they return it' do
      subject.dock(broken_bike)
      expect(subject.bikes[0].working?).to eq false
    end

    it "doesn't release broken bikes" do
      subject.capacity.times { subject.dock(random_bike) }
      expect(subject.release_bike).to be_working | eq("No bikes available!")
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

  it 'knows when it is empty' do
    expect(subject.send(:empty?)).to be true
  end


end
