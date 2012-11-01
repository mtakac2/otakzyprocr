# encoding: UTF-8

class PoliticiansController < ApplicationController
  def show
    @politician = Refinery::Politicians::Politician.find(params[:id])
  end

  def edit
    @keeper = Refinery::Keepers::Keeper.find(params[:keeper_id])
    @politician = @keeper.subjects.find(params[:id])
  end

  def update
    @keeper = Refinery::Keepers::Keeper.find(params[:keeper_id])
    @politician = @keeper.subjects.find(params[:id])

    if @politician.update_attributes(params[:politician])
      redirect_to main_app.keeper_path(@keeper), flash: { notice: 'Údaje politika byly úspěšně upraveny.'}
    else
      render 'edit'
    end
  end
end