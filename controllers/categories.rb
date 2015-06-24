# Main menus for categories
get "/categories_menu" do
  erb :"categories/categories_menu"
end

# Create a new category
get "/new_category" do
  erb :"categories/new_category_form"
end

# Add category to table
get "/new_category_form_do" do
  category = Category.new({"id" => nil, "name" => params["name"]})
  if category.add_to_database
    erb :"categories/added"
  else
    @errors = category.errors
    erb :"categories/new_category_form"
  end
end

# Get a list of all categories
get "/all_categories" do
  erb :"categories/categories"
end

# Choose a category to delete
get "/delete_category_list" do
  erb :"categories/delete_category_list"
end

# Deletes category from table
get "/delete_category" do
  category = Category.new(params["id"])
  if category.delete?
    catgegory.delete
    erb :"categories/deleted"
  else
    @message = "The category has transactions associated with it, it cannot be deleted."
    erb :"categories/delete_category_list"
  end
end