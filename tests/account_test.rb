require "minitest/autorun"
require_relative "../models/account.rb"

class AccountTest < Minitest::Test
  #test the update_balance method updates the balance correctly
  def test_update_balance
    hash = {"balance" => 10}
    test = Account.new(hash)
    test.update_balance(-5, -10)
    assert_equal(5, test.balance)
  end
  
  #test the transaction adds to the balance correctly
  def test_transaction
    hash = {"balance" => 0}
    test = Account.new(hash)
    test.transaction(10)
    assert_equal(10, test.balance)
  end
  
  #test the delete? method returns a correct boolean
  def test_delete?
    hash = {"balance" => 0}
    test = Account.new(hash)
    assert(test.delete?)
  end
end