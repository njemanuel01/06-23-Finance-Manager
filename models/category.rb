class Category< ActiveRecord::Base
  has_many :transactions
  validates :name, presence: true
  validates :name, uniqueness: true
  
  def delete?
    if self.transactions != {}
       errors.messages["transaction"] = "This category is linked to transactions."
    else
      return false
    end
  end
  
end
