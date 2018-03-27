class ProvidersController < ApplicationController

  get '/home' do
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

  post '/providers' do
    if !!Provider.find_by(username: params[:username])
      @username_already_exists = true
      erb :signup
    else
      @provider = Provider.create(name: params[:name].downcase, username: params[:username], password: params[:password])
      session[:user_id] = @provider.id
      redirect to '/home'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    login(params[:username].downcase, params[:password])
  end

  get '/logout' do
    logout!
    redirect to '/'
  end

end
