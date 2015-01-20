class Currency
  attr_accessor :amount, :code
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(another_currency)
    self.code == (another_currency.code)
    self.amount == (another_currency.amount)
  end

  def +(another_currency)
    if self.code == another_currency.code
      self.amount + another_currency.amount
    end
  end

end
