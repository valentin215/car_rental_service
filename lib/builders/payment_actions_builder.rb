class PaymentActionsBuilder
  # @param calculator [Instance<RentalPriceCalculatorService>]
  def initialize(calculator)
    @calculator = calculator
  end

  attr_reader :calculator

  def build
    [
      payment("driver", "debit", driver_payment),
      payment("owner", "credit", owner_payment),
      payment("insurance", "credit", insurance_payment),
      payment("assistance", "credit", assistance_payment),
      payment("drivy", "credit", drivy_payment)
    ]
  end

  private

  def payment(who, type, amount)
    {who: who, type: type, amount: amount}
  end

  def driver_payment
    calculator.price + calculator.additional_insurance_fee + calculator.gps_fee + calculator.baby_seat_fee
  end

  def owner_payment
    calculator.price + calculator.gps_fee + calculator.baby_seat_fee - calculator.insurance_fee - calculator.assistance_fee - calculator.drivy_fee
  end

  def insurance_payment
    calculator.insurance_fee
  end

  def assistance_payment
    calculator.assistance_fee
  end

  def drivy_payment
    calculator.drivy_fee + calculator.additional_insurance_fee
  end
end
