require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class User
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :name
  
  # Creates a new instance of the User class.
  #
  # values = hash with id and name
  #    - id = integer value, optional
  #    - name = string value
  #
  # Returns a User object
  def initialize(values = {})
    @id = values["id"]
    @name = values["name"]
  end
  
  # Finds a users total balance across all accounts
  #
  # Returns a float
  def total_balance
    account_array = self.accounts
    total = 0
    account_array.each do [x]
      result = CONNECTION.execute("SELECT balance FROM accounts WHERE id = ?;", x).first
      total += result["balance"]
    end
    
    return total
  end
  
  # Finds all accounts associated with a user
  #
  # Returns an Array of integers
  def accounts
    account_array = []
    db_array = CONNECTION.execute("SELECT account_id FROM accounts_users WHERE user_id = ?;", @id)
    db_array.each do |x|
      account_array << x["account_id"]
    end
    
    return account_array
  end
  
  # Tests to see if a user can be deleted
  #
  # Returns a Boolean  
  def delete?
    accounts_array = CONNECTION.execute("SELECT * FROM accounts_users WHERE user_id = ?;", @id)
    
    return accounts_array.empty?
  end
  
end