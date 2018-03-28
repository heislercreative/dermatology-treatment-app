class ConditionsController < ApplicationController

  get '/patients/:id/conditions/new' do
    if !logged_in?
      redirect to '/'
    else
      if current_patient
        @conditions = Condition.list
        erb :'/conditions/new'
      else
        redirect to '/home'
      end
    end
  end

  post '/patients/:id/conditions' do
    if current_patient
      @condition = current_patient.conditions.build(params[:condition])
      current_patient.save
      redirect to "/patients/#{current_patient.id}"
    else
      redirect to '/home'
    end
  end

  get '/patients/:id/conditions/:cid/edit' do
    if !logged_in?
      redirect to '/'
    else
      if current_patient
        @conditions = Condition.list
        @condition = current_patient.conditions.find_by_id(params[:cid])
        erb :'/conditions/edit'
      else
        redirect to '/home'
      end
    end
  end

  patch '/patients/:id/conditions/:cid' do
    if current_patient
      @condition = current_patient.conditions.find_by_id(params[:cid])
      @condition.update(params[:condition])
      redirect to "/patients/#{current_patient.id}"
    else
      redirect to '/home'
    end
  end

  get '/patients/:id/conditions/:cid/delete' do
    if !logged_in?
      redirect to '/'
    else
      if current_patient
        @condition = current_patient.conditions.find_by_id(params[:cid])
        erb :'/conditions/delete'
      else
        redirect to '/home'
      end
    end
  end

  delete '/patients/:id/conditions/:cid/delete' do
    if current_patient
      @condition = current_patient.conditions.find_by_id(params[:cid])
      @condition.delete
      redirect to "/patients/#{current_patient.id}"
    else
      redirect to '/home'
    end
  end

end
