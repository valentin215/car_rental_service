# frozen_string_literal: true

class RentalPriceCalculator
  class << self
    def call(cars, rentals)
      new(cars, rentals).calculate_prices
    end
  end

  attr_reader :cars, :rentals

  def initialize(cars, rentals)
    @cars = cars
    @rentals = rentals
  end

  def calculate_prices
    rentals.map do |rental|
      car = associated_car(rental_car_id: rental.car_id)
      price = rental.calculate_price(car)

      {id: rental.id, price:}
    end
  end

  private

  def associated_car(rental_car_id:) = cars.find { _1.id == rental_car_id }
end
