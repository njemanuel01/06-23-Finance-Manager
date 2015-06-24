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
  account = Account.add({"type" => params["type"], "balance" => 0})
  # add something to accounts_users
  erb :"accounts/added"
end

# Get a list of all accounts and their balances
get "/all_accounts" do
  erb :"accounts/accounts"
end

# Get information on a single user
get "/single_account/:id" do
  @account = Account.new(params["id"])
  erb :"accounts/account_single"
end

# Form to update account type with
get "/update_account_form" do
  erb :"accounts/update_account_form"
end

# Save updates to table
get "/update_account_form_do" do
  account = Account.find(params["id"])
  account.type = params["type"]
  account.save
  erb :"accounts/updated"
end

# Choose an account to delete
get "/delete_acount_list" do
  erb :"accounts/delete_account_list"
end

# Deletes account from table
get "/delete_account" do
  account = Account.new(params["id"])
  if account.delete?
    account.delete
    erb :"accounts/deleted"
  else
    @message = "The account has a balance, it cannot be deleted."
    erb :"accounts/delete_account_list"
  end
end