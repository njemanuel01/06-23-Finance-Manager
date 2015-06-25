require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Account
  extend DatabaseClassMethod
  include DatabaseInstanceMethod
  
  attr_reader :id, :balance
  attr_accessor :type
  
  # Creates a new instance of the Account class.
  #
  # values = hash with id, type, and balance
  #    - id = integer value, optional
  #    - name = string value
  #    - balance = float value
  #
  # Returns an Account object
  def initialize(values = {})
    @id = values["id"]
    @type = values["type"]
    @balance = values["balance"]
  end
  
  # Finds all users associated with an account
  #
  # Returns an Array of integers
  def users
    user_array = []
    db_array = CONNECTION.execute("SELECT user_id FROM accounts_users WHERE account_id = ?;", @id)
    db_array.each do |x|
      user_array << x["user_id"]
    end
    
    return user_array
  end
  
  # Deletes rows in accounts_users associated with the account
  def delete_bridges
    CONNECTION.execute("DELETE FROM accounts_users WHERE account_id = ?;", @id)
  end
  
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
  
  # Adds a row to the accounts_users table when a new account is created
  def bridge(user_id)
    CONNECTION.execute("INSERT INTO accounts_users (user_id, account_id) VALUES (?, ?);", user_id, @id)
  end
  
  # Tests to see if an account can be deleted
  #
  # Returns a Boolean 
  def delete?
    if @balance == 0
      return true
    else
      return false
    end
  end
  
end