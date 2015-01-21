require './currency'

class CurrencyConverter

  attr_accessor :currencies

  def initialize
    @currencies = {USD: 1.0, EUR: 0.74}
  end

  def convert(currency, code)
    return Currency.new((currency.amount * @currencies[code]), code)
  end







end
# currency_converter = CurrencyConverter.new
# currency1 = Currency.new(1, :USD)
# {currency_converter.convert(currency1, :USD)}
