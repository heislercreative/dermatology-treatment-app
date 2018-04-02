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

  post '/signup' do
    if !!Provider.find_by(username: params[:username])
      @username_already_exists = true
      erb :signup
    else
      @provider = Provider.create(name: params[:name], username: params[:username].downcase, password: params[:password])
      session[:username] = @provider.username
      redirect to '/home'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @provider = Provider.find_by(username: params[:username])
    if @provider && @provider.authenticate(params[:password])
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

  get '/logout' do
    logout!
    redirect to '/'
  end

end
