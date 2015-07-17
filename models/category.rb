class Category< ActiveRecord::Base
  has_many :transactions
  validates :name, presence: true
  validates :name, uniqueness: true
  
  def delete?
    if self.transactions != {}
       errors.messages["transaction"] = "This categor is link to transactions."
    else
      return true
    end
  end
  
end
