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

  get '/home' do
    erb :'/providers/home'
  end

  get '/failure' do
    erb :failure
  end

end
