require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'api/db_config'
require_relative 'api/movies_controller'

run Api::MoviesController