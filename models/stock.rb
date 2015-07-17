class Stock< ActiveRecord::Base
  attr_reader :name, :bid, :change, :change_percent, :day_range
  # Creates a new Stock object
  #
  # symbol - string for the company stock symbol
  #
  # Returns an object of the Stock class
  def initialize(symbol)
    @stock = StockQuote::Stock.quote(symbol)
    @name = @stock.name
    @bid = @stock.bid
    @change = @stock.change
    @change_percent = @stock.change_percent_change
    @day_range = @stock.days_range
  end
  
  # Checks to see if @stock stores information on a valid company
  #
  # Returns a string
  def error
    if @stock.response_code == 404
      "Invalid stock symbol"
    else
      "Here's the information"
    end
  end

end