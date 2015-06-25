require "stock_quote"

class Stock
  attr_reader :symbol, :bid, :change, :change_percent, :day_range

  def initialize(symbol)
    @stock = StockQuote::Stock.quote(symbol)
    @symbol = @stock.symbol
    @bid = @stock.bid
    @change = @stock.change
    @change_percent = @stock.change_percent_change
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