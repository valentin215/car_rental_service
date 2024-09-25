# main.rb
require "json"
require_relative "../lib/car"
require_relative "../lib/rental"
require_relative "../lib/option"
require_relative "../lib/rental_price_calculator"
require_relative "../lib/car_factory"
require_relative "../lib/rental_factory"
require_relative "../lib/option_factory"
require_relative "../lib/car_repository"
require_relative "../lib/option_repository"
require_relative "../lib/payment_actions_builder"
require_relative "../lib/json_rentals_builder"

input_file = "data/input.json"
input_data = JSON.parse(File.read(input_file), symbolize_names: true)

cars = CarFactory.build(input_data[:cars])
rentals = RentalFactory.build(input_data[:rentals])
options = OptionFactory.build(input_data[:options])

CarRepository.repo.cars = cars
OptionRepository.repo.options = options

json_output = JsonRentalsBuilder.call(
  rentals,
  RentalPriceCalculator,
  PaymentActionsBuilder
)

File.write("data/result.json", json_output)
