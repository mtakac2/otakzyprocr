class PoliticiansController < ApplicationController
  def show
    @politician = Refinery::Politicians::Politician.find(params[:id])
  end

  def edit
    @keeper = Refinery::Keepers::Keeper.find(params[:keeper_id])
    @politician = @keeper.subjects.find(params[:id])
  end

  def update

  end
end