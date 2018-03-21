require 'bundler/setup'
require 'mysql2'
require 'active_record'
require_relative 'models/movie'

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  host: "192.168.99.100",
  username: "web_user",
  password: "test",
  database: "web_data"
)