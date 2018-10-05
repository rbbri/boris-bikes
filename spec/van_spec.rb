require 'van'


describe Van do

  describe '#take' do
    it 'takes a broken bike from a docking station' do
      docking_station = DockingStation.new
      broken_bike = Bike.new
      docking_station.dock(broken_bike, true)
      van = Van.new
      expect(van.take(docking_station.bikes)).to eq [broken_bike]
    end

    it 'does not take a working bike from a docking station' do
      docking_station = DockingStation.new
      bike = Bike.new
      docking_station.dock(bike, false)
      van = Van.new
      expect(van.take(docking_station.bikes)).to eq []
    end

  end

  describe '#deliver' do
    it 'delivers a broken bike to the garage' do
      van = Van.new
      broken_bike = Bike.new
      broken_bike.report
      van.take([broken_bike])
      garage = Garage.new
      van.deliver(garage)
      expect(garage.bikes).to eq [broken_bike]
    end
  end


  describe '#collect' do
    it 'collects a working bike from a garage' do
      van = Van.new
      garage = Garage.new
      bike = Bike.new
      garage.bikes.concat([bike])
      van.collect(garage.bikes)
      expect(van.bikes).to eq [bike]
    end
  end

  describe '#distribute' do
    it 'distributes a working bike to a docking station' do
      van = Van.new
      docking_station = DockingStation.new
      bike = Bike.new
      van.bikes.concat([bike])
      van.distribute(docking_station.bikes)
      expect(docking_station.bikes).to eq [bike]
    end


  end

end
