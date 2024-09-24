class JsonRentalsBuilder
  class << self
    def call(rentals, calculator)
      new(rentals, calculator).build_json
    end
  end

  def initialize(rentals, calculator)
    @rentals = rentals
    @calculator = calculator
  end

  attr_reader :rentals, :calculator

  def build_json = JSON.pretty_generate({rentals: rentals_data})

  private

  def rentals_data
    rentals.map do |rental|
      instance = calculator.new(rental, rental.car)

      {
        id: rental.id,
        price: instance.price,
        commission: {
          insurance_fee: instance.insurance_fee,
          assistance_fee: instance.assistance_fee,
          drivy_fee: instance.drivy_fee
        }
      }
    end
  end
end
