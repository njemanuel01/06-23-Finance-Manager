class Transaction< ActiveRecord::Base
  validates :amount, numericality: true, if: :amount_not_zero?
  validates :date, presence: true
  validates :date, presence: true
  
  def amount_not_zero?
    binding.pry
    self.amount != 0
  end
end