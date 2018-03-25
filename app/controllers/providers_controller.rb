class ProvidersController < ApplicationController

  get '/signup' do
    erb :signup
  end

  get '/home' do
    erb :'/providers/home'
  end

end
