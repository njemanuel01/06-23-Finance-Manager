require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Transaction
  extend DatabaseClassMethod
  include DatabaseInstanceMethod
  
  attr_reader :id
  attr_accessor :amount, :description, :date, :category_id, :account_id
  
  # Creates a new instance of the Transaction class.
  #
  # values = hash with id and name
  #    - id = integer value, optional
  #    - amount = float value
  #    - description = string value
  #    - date = string value
  #    - category_id = int value
  #    - account_id = int value
  #
  # Returns a Transaction object
  def initialize(value={})
    @id = values["id"]
    @amount = values["amount"]
    @description = values["description"]
    @date = values["date"]
    @category_id = values["category_id"]
    @account_id = values["account_id"]
  end
  
  
end