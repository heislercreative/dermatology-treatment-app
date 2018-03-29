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
      !!current_user
    end

    def login(username, password)
      @provider = Provider.find_by(username: username)
      if @provider && @provider.authenticate(password)
        session[:username] = @provider.username
        redirect to '/home'
      elsif @provider && !@provider.authenticate(params[:password])
        @wrong_password = true
        erb :login
      else
        @wrong_username = true
        erb :login
      end
    end

    def logout!
      session.clear
    end

    def current_user
      @provider ||= Provider.find_by(username: session[:username]) if session[:username]
    end

    def current_patient
      @patient ||= current_user.patients.find_by_id(params[:id])
    end

    def current_condition
      @condition ||= current_patient.conditions.find_by_id(params[:cid])
    end

    def condition_list
      @conditions = Condition.list
    end

  end

end
