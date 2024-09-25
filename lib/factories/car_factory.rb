# frozen_string_literal: true

require_relative "base_factory"

class CarFactory < BaseFactory
  def self.build_item(car_data)
    Car.new(car_data[:id], car_data[:price_per_day], car_data[:price_per_km])
  end
end
