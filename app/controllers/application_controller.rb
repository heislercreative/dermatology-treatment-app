class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
      set :session_secret, "cuandocalientaelsol"
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:username]
    end

    def login(username, password)
      @provider = Provider.find_by(username: username)
      if @provider && @provider.authenticate(password)
        session[:username] = @provider.username
        redirect to '/providers/home'
      elsif @provider && !@provider.authenticate(params[:password])
        @wrong_passord = true
        erb :login
      else
        @wrong_username = true
        erb :login
      end
    end

    def logout!
      session.clear
    end

  end

end
