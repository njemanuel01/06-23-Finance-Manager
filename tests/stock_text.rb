require "minitest/autorun"
require_relative "../models/stock.rb"

class StockTest < Minitest::Test
  #test the error method
  def test_error
    test = Stock.new("appl")
    assert_equal("Here's the information", test.error)
  end
  
end