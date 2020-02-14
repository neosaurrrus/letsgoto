
class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        mime_type :css, 'text/css'
        enable :sessions
        set :session_secret, "superduperhypersecret"
      end

    require "rack-flash"
    use Rack::Flash

  get '/' do
    erb :index
  end

end