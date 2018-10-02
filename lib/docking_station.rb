class DockingStation
  attr_reader :bike

  def release_bike
    raise "No bikes available!" unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
    "#{bike} successfully docked"
  end
end
