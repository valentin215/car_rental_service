# main.rb
require "json"
require_relative "../lib/models/car"
require_relative "../lib/models/rental"
require_relative "../lib/models/option"
require_relative "../lib/factories/car_factory"
require_relative "../lib/factories/rental_factory"
require_relative "../lib/factories/option_factory"
require_relative "../lib/repositories/car_repository"
require_relative "../lib/repositories/option_repository"
require_relative "../lib/builders/payment_actions_builder"
require_relative "../lib/builders/json_rentals_builder"
require_relative "../lib/services/rental_price_calculator_service"

input_file = "data/input.json"
input_data = JSON.parse(File.read(input_file), symbolize_names: true)

cars = CarFactory.build(input_data[:cars])
rentals = RentalFactory.build(input_data[:rentals])
options = OptionFactory.build(input_data[:options])

CarRepository.repo.items = cars
OptionRepository.repo.items = options

json_output = JsonRentalsBuilder.call(rentals, RentalPriceCalculatorService, PaymentActionsBuilder)

File.write("data/result.json", json_output)
