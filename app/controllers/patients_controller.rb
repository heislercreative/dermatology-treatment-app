class PatientsController < ApplicationController

  get '/patients/new' do
    erb :'/patients/new'
  end

  post '/patients' do
    patient = Patient.create(params)
    redirect to "/patients/#{patient.id}"
  end

  get '/patients/:id' do
    @patient = Patient.find_by_id(params[:id])
    @conditions = @patient.conditions
    erb :'/patients/show'
  end

end
