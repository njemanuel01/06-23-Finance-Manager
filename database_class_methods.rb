require "active_support"
require "active_support/inflector"

#Creates class methods to access the database with.
module DatabaseClassMethod
  # Gets a list of all the rows from a table
  #
  # Returns those rows as an Array of objects of the calling class
  def all
    results_as_objects = []
    CONNECTION.execute("SELECT * FROM #{self.to_s.pluralize.underscore}").each do |results|
      results_as_objects << self.new(results)
    end
    
    return results_as_objects
  end
  
  # Gets a single row from a table
  #
  # id - integer value for the the row key to lookup
  #
  # Returns the row as an object of the calling class
  def find(id)
    result = CONNECTION.execute("SELECT * FROM '#{self.to_s.pluralize.underscore}' WHERE id = ?;", id).first
    
    self.new(result)
  end
  
  # Gets a list of rows from a table
  #
  # column_name - string value for the columen to lookup
  # value - string or integer value to lookup
  #
  # Returns the rows as an Array of objects of the calling class
  def where(column_name, value)
    results_as_objects = []
    CONNECTION.execute("SELECT * FROM #{self.to_s.pluralize.underscore} WHERE #{column_name} = ?;", value).each do |results|
      results_as_objects << self.new(results)
    end
    
    return results_as_objects
  end
  
  # Inserts a row into a table
  #
  # values - Array of values to add to the row
  #
  # Returns an object of the calling class
  def add(values_hash = {}) #values_hash = {}
    columns = values_hash.keys
    values = values_hash.values
    CONNECTION.execute("INSERT INTO #{self.to_s.pluralize.underscore} (#{columns.join ", "}) VALUES (#{values.to_s[1...-1]});")

    id = CONNECTION.last_insert_row_id
    values_hash["id"] = id
      
    self.new(values_hash)
  end
  
end