class Account
  has_many :transactions
  has_and_belongs_to_many :users 
  # Adds a transaction amount to the account balance
  #
  # amount - float value
  #
  # Returns a float
  def transaction(amount)
    @balance += amount
  end
  
  # Updates the account balance when a transaction is updated or deleted
  #
  # old_value - float value for the old transaction amount
  # new_value - float value for the new transaction amount, default is 0
  #
  # Returns a float
  def update_balance(old_value, new_value = 0)
    diff = old_value - new_value
    @balance -= diff
  end
  
  # Tests to see if an account can be deleted
  #
  # Returns a Boolean 
  def delete?
    @balance == 0
  end
  
end