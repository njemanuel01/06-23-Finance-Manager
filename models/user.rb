class User
  attr_reader :id
  attr_accessor :name
  def initialize(values = {})
    @id = values["id"]
    @name = values["name"]
  end
  
  def total_balance
    
  end
  
  def accounts
    account_array = []
    db_array = CONNECTION.execute("SELECT account_id FROM #{accounts_users} WHERE #{user_id} = ?;", @id)
    db_array.each do |x|
      account_array << x["account_id"]
    end
    
    return account_array
  end
    
  def delete?
    acccounts_array = CONNECTION.execute("SELECT * FROM #{accounts_users} WHERE #{user_id} = ?;", @id)
    
    return accounts_array.empty?
  end
  
end