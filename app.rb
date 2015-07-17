require "rubygems"
require "bundler/setup"

require "pry"
require "active_record"
require "sinatra"
require "sinatra/reloader"
set :server, 'webrick'
require "bcrypt"

require "stock_quote"

# SQL/Database
require_relative "database_setup.rb"
#
# # Models
require_relative "models/user.rb"
require_relative "models/account.rb"
require_relative "models/category.rb"
require_relative "models/transaction.rb"
require_relative "models/stock.rb"

# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/accounts.rb"
require_relative "controllers/categories.rb"
require_relative "controllers/users.rb"
require_relative "controllers/transactions.rb"
require_relative "controllers/stocks.rb"