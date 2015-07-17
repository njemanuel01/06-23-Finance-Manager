def check_user
  if session[:id] == nil
    redirect "/"
  end
end 
# Main menus for users
get "/users_menu" do
  check_user
  @user = User.find(session["id"])
  erb :"users/users_menu"
end

# Form to update user name with
get "/update_email_form" do
  check_user
  erb :"users/update_email_form"
end

# Save updates to table
get "/update_email_form_do" do
  check_user
  user = User.find(session["id"])
  user.email = params["user"]["email"]
  binding.pry
  if !user.valid?
    @errors = "Email is already used."
    return erb :"users/update_email_form"
  end
  user.save
  @errors = "Email updated"
  redirect "/users_menu"
end

# Form to update user name with
get "/change_password_form" do
  check_user
  erb :"users/update_password_form"
end

# Save updates to table
get "/update_password_form_do" do
  check_user
  user = User.find(session["id"])
  user.password = BCrypt::Password.create(params["user"]["password"])
  user.save
  @errors = "Password updated"
  redirect "/users_menu"
end

# Deletes user from table
get "/delete_user" do
  check_user
  user = User.find(session["id"])
  user.delete
  redirect "/"
end