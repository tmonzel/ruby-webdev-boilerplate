class ApplicationController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :public_folder, "app/public"

  get '/' do
    send_file File.join(settings.public_folder, "index.html")
  end
end