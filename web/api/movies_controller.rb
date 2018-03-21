module Api
  class MoviesController < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    get '/api/movies' do
      "Listing all my movies"
    end

    post '/api/movies' do
      "Adding a new movie"
    end
  end
end