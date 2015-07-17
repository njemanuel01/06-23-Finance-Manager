class Transaction< ActiveRecord::Base
  validates :amount, numericality: true
  validates :date, presence: true
  validates :date, presence: true
end