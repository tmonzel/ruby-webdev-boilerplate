module Api
  class ProductsController < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    get '/api/products' do
      "Listing all my products"
    end

    post '/api/products' do
      "Adding a new product"
    end
  end
end