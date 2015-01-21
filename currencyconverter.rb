require './currency'

class CurrencyConverter

  attr_accessor :currencies

  def initialize
    @currencies = {USD: 1.0, EUR: 0.86, GBP: 0.66, CAD: 1.23, JPY: 117.87}
  end

  def convert(currency, code)
    if currencies.include? code
      if currency.code == :USD
        return Currency.new((currency.amount * currencies[code]), code)
      else
        return Currency.new(((currency.amount *
        (currencies[code] / currencies[currency.code])).round(2)), code)
      end
    else
      raise UnknownCurrencyCodeError, "Unknown Currency"
    end
  end







end
# currency_converter = CurrencyConverter.new
# currency1 = Currency.new(1, :USD)
# {currency_converter.convert(currency1, :USD)}
