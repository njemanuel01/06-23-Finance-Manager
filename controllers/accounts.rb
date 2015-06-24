# Create a new user
get "/new_account" do
  erb :"users/new_account_form"
end

get "/new_account_form_do" do
  account = Account.add({"name" => params["name"]})
  
  erb :"accounts/added"
end

# Get a list of all users and their total balances
get "/all_accounts" do
  erb :"accounts/accounts"
end

get "/single_account" do
  @account = Account.new(params["id"])
  erb :"account/account_single"
end