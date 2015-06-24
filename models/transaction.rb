class Transaction
  attr_reader :id, :account_id, :category_id, :amount
  attr_accessor :description, :date
  def initialize(value={})
    @id = values["id"]
    @amount = values["amount"]
    @description = values["description"]
    @date = values["date"]
    @category_id = values["category_id"]
    @account_id = values["account_id"]
  end
  
  
end