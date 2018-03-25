class PatientsController < ApplicationController

  get '/patients/new' do
    erb :'/patients/new'
  end

  post '/patients' do
    patient = Patient.create(params)
    redirect to "/patients/#{patient.id}"
  end

end
