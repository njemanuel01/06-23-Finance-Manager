# Creates a connection to the finance database
CONNECTION = SQLite3::Database.new("finance.db")

# Makes tables
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'users' (id INTEGER PRIMARY KEY, name TEXT, total_balance REAL NOT NULL)")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'accounts' (id INTEGER PRIMARY KEY, account_name TEXT NOT NULL, balance REAL NOT NULL)")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'accounts_users' (user_id INTEGER, account_id INTEGER)")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'categories' (id INTEGER PRIMARY KEY, category_name TEXT NOT NULL)")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'transactions' (id INTEGER PRIMARY KEY, amount REAL NOT NULL, description TEXT, 
date TEXT NOT NULL, category_id INTEGER, account_id INTEGER)")

# Get resulst as an Array of Hashes
CONNECTION.results_as_hash = true