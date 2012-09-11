class MapController < ApplicationController
  layout 'map'

  def index
    @counties = Refinery::Counties::County.all
  end
end