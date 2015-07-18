def check_user
  if session[:id] == nil
    redirect "/"
  end
end 

# Main menus for transactions
get "/transactions_menu" do
  check_user
  erb :"transactions/transactions_menu"
end

# Create a new transaction
get "/new_transaction" do
  check_user
  @user = User.find(session["id"])
  erb :"transactions/new_transaction_form"
end

# Add transaction to table
get "/new_transaction_form_do" do
  check_user
  transaction = Transaction.new({"id" => nil, "amount" => params["transaction"]["amount"].to_f, "description" => params["transaction"]["description"], "date" => params["transaction"]["date"], 
    "category_id" => params["transaction"]["category_id"], "account_id" => params["transaction"]["account_id"]})
  if transaction.amount_not_zero?
    account = Account.find(params["transaction"]["account_id"])
    account.transaction(params["transaction"]["amount"].to_f)
    account.save
    transaction.save
    @errors = "Transaction added."
    return erb :"transactions/transactions_menu"
  else
    @errors = "Amount cannot be 0."
    erb :"transactions/transactions_menu"
  end
end

# Get a list of all transactions and their information
get "/all_transactions" do
  check_user
  @user = User.find(session["id"])
  erb :"transactions/transactions"
end

# Get information on a single transaction
get "/single_transaction/:id" do
  check_user
  @transaction = Transaction.find(params["id"])
  erb :"transactions/transaction_single"
end

# Get a list of transactions for a specific account
get "/where" do
  check_user
  @user = User.find(session["id"])
  erb :"transactions/where_account"
end

# Form to update transactions with
get "/update_transaction_form" do
  check_user
  @user = User.find(session["id"])
  erb :"transactions/update_transaction_form"
end

# Save updates to table
get "/update_transaction_form_do" do
  check_user
  transaction = Transaction.find(params["transaction"]["id"])
  @errors = []
  if params["transaction"]["account_id"] != "blank"
    account = Account.find(transaction.account_id)
    account.update_balance(transaction.amount)
    account.save
    transaction.account_id = params["transaction"]["account_id"]
    account = Account.find(transaction.account_id)
    account.transaction(transaction.amount)
    account.save
    @errors << "Transaction account updated."
  end
  if params["transaction"]["category_id"] != "blank"
    transaction.category_id = params["transaction"]["category_id"]
    @errors << "Transaction category updated."
  end
  if params["transaction"]["amount"] != ""
    account = Account.find(transaction.account_id)
    account.update_balance(transaction.amount, params["transaction"]["amount"].to_f)
    account.save
    transaction.amount = params["transaction"]["amount"].to_f
    @errors << "Transaction amount updated."
  end
  if params["transaction"]["date"] != ""
    transaction.date = params["transaction"]["date"]
    @errors << "Transaction date updated."
  end
  if params["transaction"]["description"] != ""
    transaction.description = params["transaction"]["description"]
    @errors << "Transaction description updated."
  end
  
  transaction.save
  erb :"transactions/transactions_menu"
end

# Choose a transaction to delete
get "/delete_transaction_list" do
  check_user
  @user = User.find(session["id"])
  erb :"transactions/delete_transaction_list"
end

# Deletes transaction from table
get "/delete_transaction" do
  check_user
  transaction = Transaction.find(params["transaction"]["id"])
  account = Account.find(transaction.account_id)
  account.update_balance(transaction.amount)
  account.save
  transaction.delete
  @errors = "Transaction deleted."
  erb :"transactions/transactions_menu"
end