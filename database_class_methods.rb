require "active_support"
require "active_support/inflector"

#Creates class methods to access the database with.
module DatabaseClassMethod
  
  # Creates a string for the calling classes table
  #
  # Returns a string
  def tablename
    self.to_s.tableize
  end
  
  # Creates an Array of objects out of an Array of Hashes
  #
  # result - Array of results from a table call
  #
  # Returns an Array of objects
  def results_as_objects(results)
    objects = []
    results.each do |result|
      objects << self.new(result)
    end
    
    return objects
  end
  
  # Gets a list of all the rows from a table
  #
  # Returns those rows as an Array of objects of the calling class
  def all
    results = CONNECTION.execute("SELECT * FROM #{tablename}")
    
    self.results_as_objects(results)
  end
  
  # Gets a single row from a table
  #
  # id - integer value for the the row key to lookup
  #
  # Returns the row as an object of the calling class
  def find(id)
    result = CONNECTION.execute("SELECT * FROM '#{tablename}' WHERE id = ?;", id).first
    
    self.new(result)
  end
  
  # Gets a list of rows from a table
  #
  # column_name - string value for the columen to lookup
  # value - string or integer value to lookup
  #
  # Returns the rows as an Array of objects of the calling class
  def where(column_name, value)
    results = CONNECTION.execute("SELECT * FROM #{tablename} WHERE #{column_name} = ?;", value)
    
    return self.results_as_objects(results)
  end
  
  # Inserts a row into a table
  #
  # values - Array of values to add to the row
  #
  # Returns an object of the calling class
  def add(values_hash = {}) #values_hash = {}
    columns = values_hash.keys
    values = values_hash.values
    CONNECTION.execute("INSERT INTO #{tablename} (#{columns.join ", "}) VALUES (#{values.to_s[1...-1]});")

    id = CONNECTION.last_insert_row_id
    values_hash["id"] = id
      
    self.new(values_hash)
  end
  
end