# frozen_string_literal: true

class RentalPriceCalculator
  attr_reader :rental, :car

  def initialize(rental, car)
    @car = car
    @rental = rental
  end

  def price = days_price + distance_price

  def insurance_fee = (commission * 0.5).to_i

  def assistance_fee = rental.rental_days * 100

  def drivy_fee = (insurance_fee - assistance_fee).to_i

  private

  def commission = price * 0.3

  def distance_price = rental.distance * car.price_per_km

  def days_price
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
