require "stock_quote"

class Stock
  attr_reader :symbol, :bid, :offer, :book_value, :day_low, :day_high, :day_range

  def initialize(symbol)
    @stock = StockQuote::Stock.quote(symbol)
    @symbol = @stock.symbol
    @bid = @stock.bid
    @book_value = @stock.book_value
    @day_low = @stock.days_low
    @day_high = @stock.days_high
    @day_range = @stock.days_range
  end

  def error
    if @stock.response_code = 404
      "Invalid stock symbol"
    else
      "Here's the information"
    end
  end

end