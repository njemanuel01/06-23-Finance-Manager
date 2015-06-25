# Main menus for users
get "/users_menu" do
  erb :"users/users_menu"
end

# Create a new user
get "/new_user" do
  erb :"users/new_user_form"
end

# Add user to table
get "/new_user_form_do" do
  user = User.add({"name" => params["user"]["name"]})
  
  erb :"users/added"
end

# Get a list of all users and their total balances
get "/all_users" do
  erb :"users/users"
end

# Get information on a single user
get "/single_user/:id" do
  @user = User.find(params["id"])
  erb :"users/user_single"
end

# Form to update user name with
get "/update_user_form" do
  erb :"users/update_user_form"
end

# Save updates to table
get "/update_user_form_do" do
  user = User.find(params["user"]["id"])
  user.name = params["user"]["name"]
  user.save
  erb :"users/updated"
end

# Choose a user to delete
get "/delete_user_list" do
  erb :"users/delete_user_list"
end

# Deletes user from table
get "/delete_user" do
  user = User.find(params["user"]["id"])
  if user.delete?
    user.delete
    erb :"users/deleted"
  else
    @message = "The user has accounts associated with it, it cannot be deleted."
    erb :"users/delete_user_list"
  end
end