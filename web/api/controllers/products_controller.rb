module Api
  class ProductsController < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    get '/api/products' do
      json Product.all
    end

    post '/api/products' do
      "Adding a new product"
    end
  end
end