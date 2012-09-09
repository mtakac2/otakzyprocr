class PartiesController < ApplicationController
  def edit
    @keeper = Refinery::Keepers::Keeper.find(params[:keeper_id])
    @party = @keeper.subjects.find(params[:id])
  end

  def update

  end
end