# encoding: UTF-8

class UsersController < ApplicationController
  def new    
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
  end

  def create
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    session[:user_params].deep_merge!(params[:user]) if params[:user]
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]

    if @user.valid?
      if @user.last_step?
        @user.save if @user.all_valid?
      else
        @user.next_step
      end

      session[:user_step] = @user.current_step
    end

    if @user.new_record?
      render 'new'
    else
      session[:user_step] = session[:user_params] = nil
      session[:user_id] = @user.id
      redirect_to '/', :notice => 'Vaše registrace proběhla úspěšne.'
    end    
  end
end