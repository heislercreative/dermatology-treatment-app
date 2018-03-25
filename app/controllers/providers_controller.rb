class ProvidersController < ApplicationController

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    provider = Provider.new(params)
    if provider.save
      redirect to '/login'
    else
      redirect to '/failure'
    end
  end

  get '/home' do
    erb :'/providers/home'
  end

end
