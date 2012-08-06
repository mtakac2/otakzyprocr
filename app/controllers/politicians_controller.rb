class PoliticiansController < ApplicationController
  def edit
    @keeper = Refinery::Keepers::Keeper.find(params[:keeper_id])
    @politician = @keeper.subjects.find(params[:id])
  end

  def update

  end
end