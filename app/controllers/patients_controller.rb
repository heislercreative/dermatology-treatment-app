class PatientsController < ApplicationController

  get '/patients/new' do
    erb :'/patients/new'
  end

end
