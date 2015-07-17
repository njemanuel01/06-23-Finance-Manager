class User< ActiveRecord::Base
  has_and_belongs_to_many :accounts
  validates :email, presence: true
  validates :email, uniqueness: true 
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
  
  # Checks to see if the user has entered the correct password
  #
  # Returns a Boolean.
  def valid_password?(password)
    if !(BCrypt::Password.new(self.password) == password)
      errors.messages["login"] = "Login Failed."
    end
    
    return errors.messages.empty?
  end 
end