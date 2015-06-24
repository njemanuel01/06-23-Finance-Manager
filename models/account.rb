class Account
  attr_reader :id, :balance
  attr_accessor :type
  
  def initialize(values = {})
    @id = values["id"]
    @type = values["type"]
    @balance = values["balance"]
  end
  
  def users
    user_array = []
    db_array = CONNECTION.execute("SELECT user_id FROM #{accounts_users} WHERE #{account_id} = ?;", @id)
    db_array.each do |x|
      user_array << x["user_id"]
    end
    
    return user_array
  end
  
  def transaction(amount)
    @balance += amount
  end
  
  def update_balance(old_value, new_value = 0)
    diff = old_value - new_value
    @balance -= diff
  end
  
  def delete?
    if @balance == 0
      return true
    else
      return false
    end
  end
end