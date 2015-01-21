
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
    else
      raise DifferentCurrencyCodeError, "Different currencies cannot be added together"
    end
  end

  def -(another_currency)
    if self.code == another_currency.code
      self.amount - another_currency.amount
    else
      raise DifferentCurrencyCodeError, "Different currencies cannot be subtracted together"
    end
  end

  def *(number)
    a = self.amount * number
    Currency.new(a, code)
  end

end
