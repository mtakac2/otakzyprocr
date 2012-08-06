# encoding: UTF-8

class KeepersController < ApplicationController
  def show
    @keeper = Refinery::Keepers::Keeper.find(params[:id])
    @politicians = @keeper.subjects.where("subtype = ?", 'Refinery::Politicians::Politician')
    @parties = @keeper.subjects.where("subtype = ?", 'Refinery::Parties::Party')    
  end

  def edit
    @keeper = Refinery::Keepers::Keeper.find(params[:id])
  end  

  def update
    @keeper = Refinery::Keepers::Keeper.find(params[:id])

    if !@keeper.password.blank?
      if @keeper.authenticate(params[:old_password])
        @keeper.password = params[:keeper][:password]
        @keeper.password_confirmation = params[:keeper][:password_confirmation]
      else
        params[:keeper][:password] = nil
        params[:keeper][:password_confirmation] = nil
      end
    end

    if @keeper.update_attributes(params[:keeper])
      redirect_to main_app.keeper_path @keeper, :notice => 'Updated!!!'
    else
      render 'edit'
    end
  end

  def activate
    @keeper = Refinery::Keepers::Keeper.find_by_activation_code params[:activation_code]

    if @keeper.nil?
      redirect_to '/'
    end

    @keeper.activation_code = nil
    
    if @keeper.save
      session[:user_id] = @keeper.id
      session[:user_type] = @keeper.class.name
      redirect_to main_app.edit_keeper_path @keeper, :notice => 'Váš účet byl úspěšne aktivován. Prosím skontrolujte / doplnte Vaše údaje.'      
    end    
  end
end