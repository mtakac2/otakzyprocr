# encoding: UTF-8

class KeepersController < ApplicationController
  before_filter :authorized_politician_access?, only: [:show, :edit, :update]
  before_filter :authorized_user_access?, only: [:show, :edit, :update]
  before_filter :redirect_logged_in_user, only: :activate

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

    if @keeper.update_attributes(params[:keeper])
      redirect_to main_app.keeper_path(@keeper), :flash => { :success => 'Váš účet byl úspěšne upraven.' }
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
      redirect_to main_app.edit_keeper_path(@keeper), :flash => { :success => 'Váš účet byl úspěšne aktivován. Prosím skontrolujte / doplnte Vaše údaje.' }
    end    
  end
end