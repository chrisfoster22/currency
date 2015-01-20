require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test

  def test_has_amount_and_currency_code
    assert Currency.new("", "")
  end

  def test_identical_currencies_equal_each_other
    dollar = Currency.new(100, "USD")
    canadian_dollar = Currency.new(100, "USD")
    assert canadian_dollar == dollar
  end

  def test_identical_currencies_can_be_added_together
    dollar = Currency.new(100, "USD")
    canadian_dollar = Currency.new(50, "USD")
    assert_equal 150, dollar + canadian_dollar
  end


end
