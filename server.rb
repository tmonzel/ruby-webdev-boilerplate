require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  'Hello Heroku v2 is running! Back to normal'
end