class ConditionsController < ApplicationController

  get '/conditions/new' do
    erb :'/conditions/new'
  end

  post '/conditions' do

    redirect to "/patients/#{@patient.id}"
  end

  get '/conditions/:id' do

    erb :'/conditions/show'
  end

  get '/conditions/:id/edit' do

    erb :'/conditions/edit'
  end

  patch '/conditions/:id' do

    redirect to "/conditions/#{@condition.id}"
  end

  delete '/conditions/:id/delete' do

    redirect to "/patients/#{@patient.id}"
  end

end
