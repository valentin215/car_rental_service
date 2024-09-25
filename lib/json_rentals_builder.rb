class JsonRentalsBuilder
  class << self
    def call(rentals, calculator, builder)
      new(rentals, calculator, builder).build_json
    end
  end

  def initialize(rentals, calculator, builder)
    @rentals = rentals
    @calculator = calculator
    @builder = builder
  end

  attr_reader :rentals, :calculator, :builder

  def build_json = JSON.pretty_generate({rentals: rentals_data})

  private

  def rentals_data
    @result = rentals.map do |rental|
      calculator_instance = calculator.new(rental, rental.car)
      builder_instance = builder.new(calculator_instance)

      {id: rental.id, options: rental.options_list, actions: builder_instance.build}
    end
  end
end
