get "/stock" do
  erb :"stocks/stock_form"
end

get "/stock_form_do" do
  @stock = Stock.new(params["stock"]["symbol"])
  @message = @stock.error
  erb :"stock_info"
end