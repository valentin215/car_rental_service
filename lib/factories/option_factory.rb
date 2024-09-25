# frozen_string_literal: true

require_relative "base_factory"

class OptionFactory < BaseFactory
  def self.build_item(option_data)
    Option.new(option_data[:id], option_data[:rental_id], option_data[:type])
  end
end
