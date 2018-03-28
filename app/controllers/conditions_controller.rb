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
        current_condition
        @conditions = Condition.list
        erb :'/conditions/edit'
      else
        redirect to '/home'
      end
    end
  end

  patch '/patients/:id/conditions/:cid' do
    if current_patient
      current_condition.update(params[:condition])
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
        erb :'/conditions/delete'
      else
        redirect to '/home'
      end
    end
  end

  delete '/patients/:id/conditions/:cid/delete' do
    if current_patient
      current_condition.delete
      redirect to "/patients/#{current_patient.id}"
    else
      redirect to '/home'
    end
  end

end
