configure :development do
  require "sqlite3"
  ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "finance_manager.db")
end

configure :production do
  require "pg"  
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

# Database setup
unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.text :email
    t.text :password
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:accounts)
  ActiveRecord::Base.connection.create_table :accounts do |t|
    t.text :name
    t.float :balance
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:categories)
  ActiveRecord::Base.connection.create_table :categories do |t|
    t.text :name
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:transactions)
  ActiveRecord::Base.connection.create_table :transactions do |t|
    t.float :amount
    t.text :description
    t.text :date
    t.integer :category_id
    t.integer :account_id
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:accounts_users)
  ActiveRecord::Base.connection.create_table :accounts_users do |t|
    t.integer :account_id
    t.integer :user_id
  end  
end
