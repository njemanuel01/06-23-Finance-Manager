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
  account = Account.find(params["account_id"])
  account.transaction
  account.save
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
  @message = []
  if params["account_id"] != "blank"
    transaction.account_id = params["account_id"]
    @message << "Transaction account updated."
  end
  if params["category_id"] != "blank"
    transaction.category_id = params["category_id"]
    @message << "Transaction category updated."
  end
  if params["amount"] != ""
    transaction.amount = params["amount"].to_f
    # update account total
    @message << "Transaction amount updated."
  end
  if params["date"] != ""
    transaction.date = params["date"]
    @message << "Transaction date updated."
  end
  if params["description"] != ""
    transaction.description = params["description"]
    @message << "Transaction description updated."
  end
  
  transaction.save
  erb :"transactions/updated"
end

# Choose a transaction to delete
get "/delete_transaction_list" do
  erb :"transactions/delete_transaction_list"
end

# Deletes transaction from table
get "/delete_transaction" do
  #update to account balance
  transaction = Transaction.find(params["id"])
  transaction.delete
  erb :"transactions/deleted"
end