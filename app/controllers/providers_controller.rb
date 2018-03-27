class ProvidersController < ApplicationController

  get '/providers/home' do
    @provider = Provider.find(session[:user_id])
    @patients = @provider.patients
    erb :'/providers/home'
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

  get '/signup-retry' do
    erb :retry
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    provider = Provider.find_by(username: params[:username])
    if provider && provider.authenticate(params[:password])
      session[:user_id] = provider.id
      redirect to '/providers/home'
    else
      redirect to '/failure'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  get '/failure' do
    erb :failure
  end

end
