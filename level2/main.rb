# main.rb
require "json"
require_relative "../lib/car"
require_relative "../lib/rental"
require_relative "../lib/rental_price_calculator"
require_relative "../lib/car_factory"
require_relative "../lib/rental_factory"

input_file = "data/input.json"

input_data = JSON.parse(File.read(input_file), symbolize_names: true)

cars = CarFactory.build(input_data[:cars])
rentals = RentalFactory.build(input_data[:rentals])

calculator = RentalPriceCalculator.new(cars, rentals)
output_data = {rentals: calculator.calculate_prices}

File.write("data/result.json", JSON.pretty_generate(output_data))
