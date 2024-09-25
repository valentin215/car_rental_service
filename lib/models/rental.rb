# frozen_string_literal: true

require "date"
require_relative "../repositories/car_repository"
require_relative "../repositories/option_repository"

class Rental
  attr_reader :id, :car_id, :start_date, :end_date, :distance

  def initialize(id, car_id, start_date, end_date, distance)
    @id = id
    @car_id = car_id
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @distance = distance
  end

  def options
    OptionRepository.repo.where(rental_id: id)
  end

  def car
    CarRepository.repo.find(car_id)
  end

  def options_list
    options.map(&:type)
  end

  def rental_days
    (end_date - start_date).to_i + 1
  end

  def gps? = options_list.include?("gps")

  def baby_seat? = options_list.include?("baby_seat")

  def additional_insurance? = options_list.include?("additional_insurance")
end
