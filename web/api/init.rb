require 'sinatra/json'
require 'bundler/setup'
require 'mysql2'
require 'active_record'
require_relative 'models/product'
require_relative 'controllers/products_controller'

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  host: ENV['DB_HOST'] || 'localhost',
  username: "web_user",
  password: "test",
  database: "web_data"
)