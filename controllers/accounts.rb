def check_user
  if session[:id] == nil
    redirect "/"
  end
end 
# Main menus for accounts
get "/accounts_menu" do
  check_user
  erb :"accounts/accounts_menu"
end

# Create a new account
get "/new_account" do
  check_user
  erb :"accounts/new_account_form"
end

# Add account to table
get "/new_account_form_do" do
  check_user
  user = User.find(session["id"])
  account = Account.new({"name" => params["account"]["name"], "balance" => 0.0})
  account.save
  account.users << user
  if params["account"]["id2"] != "blank"
    user = User.find(params["account"]["id2"])
    account.users << user
  end
  if params["account"]["id3"] != "blank"
    user = User.find(params["account"]["id3"])
    account.users << user
  end
  @errors = "Account added"
  erb :"accounts/new_account_form"
end

# Get a list of all accounts and their balances
get "/all_accounts" do
  check_user
  @user = User.find(session["id"])
  erb :"accounts/accounts"
end

# Get information on a single user
get "/single_account/:id" do
  check_user
  @account = Account.find(params["id"])
  @users = @account.users
  erb :"accounts/account_single"
end

# Form to update account type with
get "/update_account_form" do
  check_user
  @user = User.find(session["id"])
  erb :"accounts/update_account_form"
end

# Save updates to table
get "/update_account_form_do" do
  check_user
  account = Account.find(params["account"]["id"])
  account.name = params["account"]["name"]
  account.save
  @errors = "Account updated."
  erb :"accounts/accounts_menu"
end

# Choose an account to delete
get "/delete_account_list" do
  check_user
  @user = User.find(session["id"])
  erb :"accounts/delete_account_list"
end

# Deletes account from table
get "/delete_account" do
  check_user
  account = Account.find(params["account"]["id"])
  if account.delete?
    account.users.each do |user|
      account.users.delete(user)
    end
    account.delete
    @errors = "Account deleted."
    erb :"accounts/accounts_menu"
  else
    @errors = "The account has a balance, it cannot be deleted."
    erb :"accounts/accounts_menu"
  end
end