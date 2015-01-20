require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test

  def test_has_amount_and_currency_code
    assert Currency.new("", "")
  end




end
