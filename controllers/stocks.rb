def check_user
  if session[:id] == nil
    redirect "/"
  end
end 

get "/stock" do
  check_user
  erb :"stocks/stock_form"
end

get "/stock_form_do" do
  check_user
  @stock = Stock.new(params["stock"]["symbol"])
  @message = @stock.error
  erb :"stocks/stock_info"
end