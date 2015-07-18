def check_user
  if session[:id] == nil
    redirect "/"
  end
end 

# Main menus for categories
get "/categories_menu" do
  check_user
  erb :"categories/categories_menu"
end

# Create a new category
get "/new_category" do
  check_user
  erb :"categories/new_category_form"
end

# Add category to table
get "/new_category_form_do" do
  check_user
  category = Category.new({"name" => params["category"]["name"]})
  if category.valid?
    category.save
    @errors = "Category saved."
    erb :"categories/new_category_form"
  else
    binding.pry
    @errors = "Category name " + category.errors.messages[:name][0]
    erb :"categories/new_category_form"
  end
end

# Get a list of all categories
get "/all_categories" do
  check_user
  erb :"categories/categories"
end

# Choose a category to delete
get "/delete_category_list" do
  check_user
  erb :"categories/delete_category_list"
end

# Deletes category from table
get "/delete_category" do
  check_user
  category = Category.find(params["category"]["id"])
  if category.delete?
    binding.pry
    @errors = category.errors.messages["transaction"]
    erb :"categories/delete_category_list"
  else
    category.delete
    @errors = "Category deleted."
    erb :"categories/delete_category_list"
  end
end