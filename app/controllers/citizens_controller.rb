# encoding: UTF-8

class CitizensController < ApplicationController
  def new    
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    session[:citizen_params] ||= {}
    @citizen = Refinery::Citizens::Citizen.new(session[:citizen_params])
    @citizen.current_step = session[:citizen_step]
  end

  def create
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    session[:citizen_params].deep_merge!(params[:citizen]) if params[:citizen]
    @citizen = Refinery::Citizens::Citizen.new(session[:citizen_params])
    @citizen.current_step = session[:citizen_step]

    if @citizen.valid?
      if @citizen.last_step?
        @citizen.save if @citizen.all_valid?
      else
        @citizen.next_step
      end

      session[:citizen_step] = @citizen.current_step
    end

    if @citizen.new_record?
      render 'new'
    else
      session[:citizen_step] = session[:citizen_params] = nil
      session[:user_id] = @citizen.id
      redirect_to '/', :notice => 'Vaše registrace proběhla úspěšne.'
    end    
  end
end