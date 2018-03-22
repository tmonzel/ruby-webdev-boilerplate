require 'sinatra'
require 'sinatra/reloader' if development?

# Initializing the api
require_relative 'api/init'

# Initializing the application
require_relative 'app/init'

use Api::ProductsController
run ApplicationController