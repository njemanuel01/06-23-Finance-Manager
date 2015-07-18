class Transaction< ActiveRecord::Base
  validates :amount, numericality: true
  validates :date, presence: true
  validates :date, presence: true
  
  def amount_not_zero?
    self.amount != 0
  end
end