class Transaction
  attr_reader :id, :account_id, :category_id, :amount
  attr_accessor :description, :date
  def initialize(value={})
    @id = values["id"]
    @account_id = values["account_id"]
    @category_id = values["category_id"]
    @amount = values["amount"]
    @description = values["description"]
    @date = values["date"]
  end
  
  
end