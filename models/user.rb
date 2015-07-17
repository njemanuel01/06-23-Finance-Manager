class User
  has_and_belongs_to_many :accounts 
  # Finds a users total balance across all accounts
  #
  # Returns a float
  def total_balance
    account_array = self.accounts
    total = 0
    account_array.each do |account|
      total += account["balance"]
    end
    return total
  end 
end