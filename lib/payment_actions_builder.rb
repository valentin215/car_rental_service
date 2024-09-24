class PaymentActionsBuilder
  def initialize(rental_price_calculator)
    @calculator = rental_price_calculator
  end

  attr_reader :calculator

  def build
    [
      payment("driver", "debit", calculator.price),
      payment("owner", "credit", owner_amount),
      payment("insurance", "credit", calculator.insurance_fee),
      payment("assistance", "credit", calculator.assistance_fee),
      payment("drivy", "credit", calculator.drivy_fee)
    ]
  end

  private

  def payment(who, type, amount)
    {who: who, type: type, amount: amount}
  end

  def owner_amount
    calculator.price - calculator.insurance_fee - calculator.assistance_fee - calculator.drivy_fee
  end
end
