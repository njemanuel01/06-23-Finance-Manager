require "pry"
require "sinatra"
require "sinatra/reloader"

# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/user.rb"
require_relative "models/account.rb"
require_relative "models/category.rb"
require_relative "models/transaction.rb"

# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/questions.rb"
require_relative "controllers/students.rb"