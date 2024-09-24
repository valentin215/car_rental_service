# frozen_string_literal: true

require_relative "factory"

class CarFactory < Factory
  def self.build_item(car_data)
    Car.new(car_data[:id], car_data[:price_per_day], car_data[:price_per_km])
  end
end
