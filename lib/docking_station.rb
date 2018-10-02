class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available!" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Dock full!" if full?
    @bikes << bike
    "#{bike} successfully docked"
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count == 0
  end

  private :full?, :empty?

end
