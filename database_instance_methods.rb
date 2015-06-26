require "active_support"
require "active_support/inflector"

#Creates instance methods to access the database with.
module DatabaseInstanceMethod
  
  # Gets a single column value from a row in a table
  #
  # Retuns either a string or integer
  def get(field)
    result = CONNECTION.execute("SELECT * FROM '#{self.class.to_s.pluralize.underscore}' WHERE id = ?;", @id).first
    result[field]
  end
  
  # Updates the information in a single row of a table
  #
  # Returns a string.
  def save
    hash = self.attr_hash
    sql_hash = hash.to_s.delete "\>"

    CONNECTION.execute("UPDATE '#{self.class.to_s.pluralize.underscore}' SET #{sql_hash[1...-1]} WHERE id = ?;", @id)
    "Saved."
  end
  
  # Creates a Hash from the instances attributes
  #
  # Returns a Hash
  def attr_hash
    hash = {}
    self.instance_variables.each {|var| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
    hash.delete("id")
    hash.delete("errors")
    return hash
  end
  
  # Deletes a row from a table
  #
  # Returns a string.
  def delete
    CONNECTION.execute("DELETE FROM '#{self.class.to_s.pluralize.underscore}' WHERE id = ?;", @id)
    "Deleted."
  end
  
  # Adds a new country to a table
  #
  # Returns a Boolean.
  def add_to_database
    hash = self.attr_hash
    columns = hash.keys
    values = hash.values
    if self.valid?
      CONNECTION.execute("INSERT INTO #{self.class.to_s.pluralize.underscore} (#{columns.join ", "}) VALUES (#{values.to_s[1...-1]});")
      @id = CONNECTION.last_insert_row_id
    else
      false
    end
  end
  
end