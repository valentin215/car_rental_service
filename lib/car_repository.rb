class CarRepository
  def self.repo
    @repo ||= new
  end

  def initialize
    @cars = []
  end

  attr_accessor :cars

  def find(car_id)
    cars.find { |car| car.id == car_id }
  end
end
