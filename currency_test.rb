require 'minitest/autorun'
require 'minitest/pride'
require './currency'
require './currencyconverter'

class DifferentCurrencyCodeError < StandardError
end

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

  def test_identical_currencies_can_be_subtracted_together
    dollar = Currency.new(100, "USD")
    canadian_dollar = Currency.new(50, "USD")
    assert_equal 50, dollar - canadian_dollar
  end

  def test_different_currencies_cannot_be_added_together
    dollar = Currency.new(100, "USD")
    canadian_dollar = Currency.new(50, "CAD")
    assert_raises(DifferentCurrencyCodeError) do
      dollar - canadian_dollar
    end
    assert_raises(DifferentCurrencyCodeError) do
      dollar + canadian_dollar
    end
  end

  def test_can_be_multiplied_by_fixnum_or_float
    dollar = Currency.new(10, "USD")
    canadian_dollar = Currency.new(5, "CAD")
    assert_equal Currency.new(50, "USD"), dollar * 5
    assert_equal Currency.new(50.0, "CAD"), canadian_dollar * 10.0
  end

  def test_currency_converter_contains_hash_of_codes
    assert CurrencyConverter.new.currencies.key?(:USD)
    assert CurrencyConverter.new.currencies.key?(:EUR)
    assert CurrencyConverter.new.currencies.value?(1.0)
    assert CurrencyConverter.new.currencies.value?(0.86)
  end

  def test_converter_returns_object_with_same_code
    currency1 = Currency.new(1, :USD)
    currency_converter = CurrencyConverter.new
    assert_equal currency_converter.convert(currency1, :USD), Currency.new(1, :USD)
  end

  def test_can_convert_currencies
    currency1 = Currency.new(100, :USD)
    currency_converter = CurrencyConverter.new
    assert_equal currency_converter.convert(currency1, :EUR), Currency.new(86, :EUR)
  end

  def test_can_convert_many_currencies
    currency1 = Currency.new(100, :USD)
    currency_converter = CurrencyConverter.new
    assert_equal currency_converter.convert(currency1, :EUR), Currency.new(86, :EUR)
    assert_equal currency_converter.convert(currency1, :GBP), Currency.new(66, :GBP)
    assert_equal currency_converter.convert(currency1, :CAD), Currency.new(123, :CAD)
    assert_equal currency_converter.convert(currency1, :JPY), Currency.new(11787, :JPY)

  end
end
