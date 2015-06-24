# Main menus for transactions
get "/transactions_menu" do
  erb :"transactions/transactions_menu"
end

# Create a new transaction
get "/new_transaction" do
  erb :"transactions/new_transaction_form"
end

# Add transaction to table
get "/new_transaction_form_do" do
  transaction = Transaction.add({"amount" => params["amount"].to_f, "description" => params["description"], "date" => params["date"], 
    "category_id" => params["category_id"], "account_id" => params["account_id"]})
  # update account balance
  erb :"transactions/added"
end

# Get a list of all transactions and their information
get "/all_transactions" do
  erb :"transactions/transactions"
end

# Get information on a single transaction
get "/single_transaction/:id" do
  @transaction = Transaction.find(params["id"])
  erb :"transactions/transaction_single"
end

# Form to update transactions with
get "/update_transaction_form" do
  erb :"transactions/update_transaction_form"
end

# Save updates to table
get "/update_transaction_form_do" do
  transaction = Transaction.find(params["id"])
  #muliple updates
  
  erb :"transactions/updated"
end

# Choose a transaction to delete
get "/delete_transaction_list" do
  erb :"transactions/delete_transaction_list"
end

# Deletes transaction from table
get "/delete_transaction" do
  transaction = Transaction.find(params["id"])
  user.delete
  erb :"transactions/deleted"
end