require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'api/db_config'
require_relative 'api/movies_controller'

#set :bind, '0.0.0.0'

run Api::MoviesController