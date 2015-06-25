get "/stock" do
  if params["stock"]["symbol"]
    @stock = Stock.new(params["stock"]["symbol"])
    @message = @stock.error
  end
  
  erb :"stocks/stock_form"
end