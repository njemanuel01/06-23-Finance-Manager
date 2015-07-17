get "/" do
  erb :"main/login"
end

get "/user" do
  array = User.where("email" => params["email"])
  if array == []
    @errors = "Login Failed."
    return erb :"main/login"
  end
  user = array[0]
  if user.valid_password?(params["password"])
    session[:id] = user.id
    return erb :"main/home"
  else
    @errors = user.errors.messages["login"]
    erb :"main/login"
  end
end

get "/new_user" do
  erb :"main/new_user_form"
end

get "/new_user_form_do" do
  password = BCrypt::Password.create(params["password"])
  user = User.new({"id" => nil, "email" => params["email"], "password" => password})
  if user.valid?
    user.save
    session[:id] = user.id
    return erb :"main/home"
  else
    @errors = user.errors.messages["login"]
    erb :new_user_form
  end
end
