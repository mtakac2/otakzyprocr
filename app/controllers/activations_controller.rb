class ActivationsController < ApplicationController
  def new
    @keeper = Refinery::Keepers::Keeper.find_by_activation_code params[:activation_code]

    if @keeper.nil?
      redirect_to '/'
    end
  end

  def create
    
  end
end