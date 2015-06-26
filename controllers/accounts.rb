# Main menus for accounts
get "/accounts_menu" do
  erb :"accounts/accounts_menu"
end

# Create a new account
get "/new_account" do
  erb :"accounts/new_account_form"
end

# Add account to table
get "/new_account_form_do" do
  account = Account.add({"type" => params["account"]["type"], "balance" => 0})
  account.bridge(params["account"]["id1"])
  if params["account"]["id2"] != "blank"
    account.bridge(params["account"]["id2"])
  end
  if params["account"]["id3"] != "blank"
    account.bridge(params["account"]["id3"])
  end
  erb :"accounts/added"
end

# Get a list of all accounts and their balances
get "/all_accounts" do
  erb :"accounts/accounts"
end

# Get information on a single user
get "/single_account/:id" do
  @account = Account.find(params["id"])
  @users = @account.users
  erb :"accounts/account_single"
end

# Form to update account type with
get "/update_account_form" do
  erb :"accounts/update_account_form"
end

# Save updates to table
get "/update_account_form_do" do
  account = Account.find(params["account"]["id"])
  account.type = params["account"]["type"]
  account.save
  erb :"accounts/updated"
end

# Choose an account to delete
get "/delete_account_list" do
  erb :"accounts/delete_account_list"
end

# Deletes account from table
get "/delete_account" do
  account = Account.find(params["account"]["id"])
  if account.delete?
    account.delete_bridges
    account.delete
    erb :"accounts/deleted"
  else
    @message = "The account has a balance, it cannot be deleted."
    erb :"accounts/delete_account_list"
  end
end