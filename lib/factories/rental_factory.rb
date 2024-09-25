# frozen_string_literal: true

require_relative "base_factory"

class RentalFactory < BaseFactory
  def self.build_item(rental_data)
    Rental.new(
      rental_data[:id],
      rental_data[:car_id],
      rental_data[:start_date],
      rental_data[:end_date],
      rental_data[:distance]
    )
  end
end
