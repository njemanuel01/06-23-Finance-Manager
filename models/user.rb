class User
  def initialize(values = {})
    @id = values["id"]
    @total_balance = values["total_balance"]
  end
end