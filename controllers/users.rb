# Create a new user
get "/new_user" do
  erb :"users/new_user_form"
end

get "/new_user_form_do" do
  user = User.add({"name" => params["name"]})
  
  erb :"users/added"
end

# Get a list of all users and their total balances
get "/all_users" do
  erb :"users/users"
end

get "/single_user" do
  @user = User.new(params["id"])
  erb :"users/user_single"
end