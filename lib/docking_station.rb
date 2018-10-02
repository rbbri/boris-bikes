class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available!" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    @bikes << bike
    "#{bike} successfully docked"
  end
end
