class ConditionsController < ApplicationController

  get '/patients/:id/conditions/new' do
    @patient = Patient.find_by_id(params[:id])
    @conditions = Condition.list
    erb :'/conditions/new'
  end

  post '/patients/:id/conditions' do
    @condition = Condition.new(params[:condition])
    @patient = Patient.find_by_id(params[:id])
    @condition.patient_id = @patient.id
    @condition.save
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
