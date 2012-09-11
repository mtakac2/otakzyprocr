class ElectionsController < ApplicationController
  def show
    @election = Refinery::Elections::Election.find(params[:id])    
  end
end