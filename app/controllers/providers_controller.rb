class ProvidersController < ApplicationController

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    provider = Provider.new(params)
    if provider.save
      redirect to '/providers/home'
    else
      redirect to '/failure'
    end
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

  get '/home' do
    erb :'/providers/home'
  end

  get '/failure' do
    erb :failure
  end

end
