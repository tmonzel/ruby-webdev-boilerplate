module Api
  def self.log(str)
    $stdout << "#{str}\n"
  end

  class ProductsController < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
      enable :logging
    end

    get '/api/products' do
      json Product.all
    end

    post '/api/products' do
      content_type :json
      
      data = JSON.parse(request.body.read)
      product = Product.new(data);

      status 204

      if product.save
        status 201
        product.to_json
      end
    end

    delete '/api/products/:id' do
      product = Product.find_by(:id => params['id'])

      if product.destroy
        status 204
      end
    end
  end
end