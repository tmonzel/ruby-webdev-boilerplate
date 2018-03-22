class ApplicationController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :public_folder, "app/public"

  get '/vendor/*' do
    filename = params['splat'].first;
    send_file File.join("node_modules", filename)
  end

  get '/' do
    # auto serve index.html
    send_file File.join(settings.public_folder, "index.html")
  end
end