# frozen_string_literal: true

require "date"

class Rental
  attr_reader :id, :car_id, :start_date, :end_date, :distance

  def initialize(id, car_id, start_date, end_date, distance)
    @id = id
    @car_id = car_id
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @distance = distance
  end

  def rental_days
    (@end_date - @start_date).to_i + 1
  end

  def calculate_price(car)
    (rental_days * car.price_per_day) + (distance * car.price_per_km)
  end
end
