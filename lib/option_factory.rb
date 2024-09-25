require_relative "factory"

class OptionFactory < Factory
  def self.build_item(option_data)
    Option.new(option_data[:id], option_data[:rental_id], option_data[:type])
  end
end
