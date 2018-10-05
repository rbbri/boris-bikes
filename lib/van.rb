class Van

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def take(bikes)
    @bikes = bikes.select do |bike|
      !bike.working?
    end
  end

  def collect(bikes)
    @bikes.concat(bikes)
  end

  def deliver(garage)
    garage.bikes.concat(@bikes)
  end

  def distribute(docking_station)
    docking_station.concat(@bikes)
  end

end
