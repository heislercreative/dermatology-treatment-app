class PatientsController < ApplicationController

  get '/patients/new' do
    erb :'/patients/new'
  end

  post '/patients' do
    @patient = Patient.new(params[:patient])
    @provider = Provider.find(session[:user_id])
    @patient.provider_id = @provider.id
    @patient.save
    redirect to "/patients/#{@patient.id}"
  end

  get '/patients/:id' do
    @patient = Patient.find_by_id(params[:id])
    @conditions = @patient.conditions
    erb :'/patients/show'
  end

  get '/patients/:id/edit' do
    @patient = Patient.find_by_id(params[:id])
    erb :'/patients/edit'
  end

  patch '/patients/:id' do
    @patient = Patient.find_by_id(params[:id])
    @patient.update(params[:patient])
    redirect to "/patients/#{@patient.id}"
  end

  get '/patients/:id/delete' do
    @patient = Patient.find_by_id(params[:id])
    erb :'/patients/delete'
  end

  delete '/patients/:id/delete' do
    @patient = Patient.find_by_id(params[:id])
    @patient.delete
    redirect to '/providers/home'
  end

end
