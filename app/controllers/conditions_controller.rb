class ConditionsController < ApplicationController

  get '/patients/:id/conditions/new' do
    if !logged_in?
      redirect to '/'
    else
      if @patient = current_user.patients.find_by_id(params[:id])
        @conditions = Condition.list
        erb :'/conditions/new'
      else
        redirect to '/home'
      end
    end
  end

  post '/patients/:id/conditions' do
    if @patient = current_user.patients.find_by_id(params[:id])
      @condition = @patient.conditions.build(params[:condition])
      @patient.save
      redirect to "/patients/#{@patient.id}"
    else
      redirect to '/home'
    end
  end

  get '/patients/:id/conditions/:cid/edit' do
    if !logged_in?
      redirect to '/'
    else
      if @patient = current_user.patients.find_by_id(params[:id])
        @conditions = Condition.list
        @condition = @patient.conditions.find_by_id(params[:cid])
        erb :'/conditions/edit'
      else
        redirect to '/home'
      end
    end
  end

  patch '/patients/:id/conditions/:cid' do
    if @patient = current_user.patients.find_by_id(params[:id])
      @condition = @patient.conditions.find_by_id(params[:cid])
      @condition.update(params[:condition])
      redirect to "/patients/#{@patient.id}"
    else
      redirect to '/home'
    end
  end

  get '/patients/:id/conditions/:cid/delete' do
    if !logged_in?
      redirect to '/'
    else
      if @patient = current_user.patients.find_by_id(params[:id])
        @condition = @patient.conditions.find_by_id(params[:cid])
        erb :'/conditions/delete'
      else
        redirect to '/home'
      end
    end
  end

  delete '/patients/:id/conditions/:cid/delete' do
    if @patient = current_user.patients.find_by_id(params[:id])
      @condition = @patient.conditions.find_by_id(params[:cid])
      @condition.delete
      redirect to "/patients/#{@patient.id}"
    else
      redirect to '/home'
    end
  end

end
