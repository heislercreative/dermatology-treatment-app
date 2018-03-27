class ProvidersController < ApplicationController

  get '/providers/home' do
    if !logged_in?
      redirect to '/'
    else
      current_user
      @patients = @provider.patients
      erb :'/providers/home'
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if !!Provider.find_by(username: params[:username])
      @username_already_exists = true
      erb :signup
    else
      @provider = Provider.create(params)
      session[:user_id] = @provider.id
      redirect to '/providers/home'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    login(params[:username], params[:password])
  end

  get '/logout' do
    logout!
    redirect to '/'
  end

end
