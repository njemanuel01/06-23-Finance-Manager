require "minitest/autorun"
require_relative "../models/transaction.rb"

class TransactionTest < Minitest::Test
  #test the valid? method returns a correct boolean
  def test_valid?
    test = Transaction.new({"amount" => 1})
    assert(test.valid?)
  end
end