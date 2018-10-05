class DockingStation
  attr_accessor :capacity, :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    @bikes.each_with_index do |bike, index|
      return @bikes.delete_at(index) if bike.working?
    end
    "No bikes available!"
  end

  def dock(bike, broken = false)
    bike.report if broken
    raise "Dock full!" if full?
    bikes << bike
    "#{bike} successfully docked"
  end

private

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.count == 0
  end

end
