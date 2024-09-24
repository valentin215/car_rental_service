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

      {id: rental.id, price: price(rental, car)}
    end
  end

  private

  def price(rental, car)
    days_price(rental, car) + distance_price(rental, car)
  end

  def associated_car(rental_car_id:) = cars.find { _1.id == rental_car_id }

  def distance_price(rental, car)
    rental.distance * car.price_per_km
  end

  def days_price(rental, car)
    (1..rental.rental_days).sum do |day|
      case day
      when 1 then car.price_per_day
      when 2..4 then car.price_per_day * 0.9
      when 5..10 then car.price_per_day * 0.7
      else
        car.price_per_day * 0.5
      end
    end.to_i
  end
end
