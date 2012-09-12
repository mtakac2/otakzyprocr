class MapController < ApplicationController
  layout 'map'

  def index
    @counties = Refinery::Counties::County.all
    @questions = Refinery::Questions::Question.order('created_at')
  end
end