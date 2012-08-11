# encoding: UTF-8

class CitizensController < ApplicationController
  def show
    @citizen = Refinery::Citizens::Citizen.find(current_user)
  end

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
      session[:user_type] = @citizen.class.name
      redirect_to '/', :flash => { :success => 'Vítejte. Vaše registrace proběhla úspěšne. Dekujeme za Váš zájem.' }
    end
  end

  def edit
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    @citizen = Refinery::Citizens::Citizen.find(params[:id])
  end

  def update
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    @citizen = Refinery::Citizens::Citizen.find(params[:id])

    @citizen.next_step

    if @citizen.update_attributes(params[:citizen])
      redirect_to main_app.citizen_path(@citizen), :flash => { :success => 'Váš účet byl úspěšne upraven.' }
    else
      render 'edit'
    end
  end
end