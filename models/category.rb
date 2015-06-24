require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Category
  extend DatabaseClassMethod
  include DatabaseInstanceMethod
  
  attr_reader :id, :errors
  attr_accessor :category_name
  
  # Creates a new instance of the Category class.
  #
  # values = hash with id and name
  #    - id = integer value, optional
  #    - name = string value
  #
  # Returns a Category object
  def initialize(values = {})
    @id = values["id"]
    @name = values["name"]
    @errors = []
  end
  
  # Checks to see if a category already exists in the table
  #
  # Returns a Boolean.
  def valid?
    array = self.class.all
    array.each do |category|
      if @category_name == category.category_name
        @errors << "This category already exists."
      end
    end
    
    return @errors.empty?
  end
  
  # Tests to see if a category can be deleted
  #
  # Returns a Boolean
  def delete?
    transactions_array = CONNECTION.execute("SELECT * FROM transactions WHERE category_id = ?;", @id)
    
    return transactions_array.empty?
  end
  
end