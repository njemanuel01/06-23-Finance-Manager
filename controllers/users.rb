# Create a new user
get "/new_user" do
  erb :"users/new_user_form"
end

# Get a list of all users and their total balances
get "/all_users" do
  erb :"users/users"
end
