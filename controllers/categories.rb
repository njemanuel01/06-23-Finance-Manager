# Create a new user
get "/new_category" do
  erb :"categories/new_category_form"
end

get "/new_category_form_do" do
  category = Category.new({"id" => nil, "name" => params["name"]})
  if category.add_to_database
    erb :"categories/added"
  else
    @errors = category.errors
    erb :"categories/new_category_form"
  end

end

# Get a list of all users and their total balances
get "/all_categories" do
  erb :"categories/categories"
end