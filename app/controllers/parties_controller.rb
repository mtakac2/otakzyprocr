# encoding: UTF-8

class PartiesController < ApplicationController
  def show
    @party = Refinery::Parties::Party.find(params[:id])
  end

  def edit
    @keeper = Refinery::Keepers::Keeper.find(params[:keeper_id])
    @party = @keeper.subjects.find(params[:id])
  end

  def update
    @keeper = Refinery::Keepers::Keeper.find(params[:keeper_id])
    @party = @keeper.subjects.find(params[:id])

    if @party.update_attributes(params[:party])
      redirect_to main_app.keeper_path(@keeper), flash: { notice: 'Údaje strany byly úspěšně upraveny.'}
    else
      render 'edit'
    end
  end
end