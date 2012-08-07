# encoding: UTF-8

class SessionsController < ApplicationController
  def new
  end

  def create
    user = Refinery::Citizens::Citizen.find_by_email(params[:email]) || Refinery::Keepers::Keeper.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_type] = user.class.name
      redirect_to '/', :notice => 'Logged in!'
    else
      flash.now[:error] = "Zadali ste nesprávný email nebo heslo,"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = session[:user_type] = nil
    redirect_to '/', :notice => 'Logged out!'
  end
end