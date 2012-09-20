# encoding: utf-8

class Map::WorkedHoursController < ApplicationController
  layout 'map'

  def index
    @title = 'Odpracované hodiny'
    @counties = Refinery::Counties::County.all
    @questions = Refinery::Questions::Question.order('created_at DESC')
    @map_data = :worked_hours
  end

  def show
    @question = Refinery::Questions::Question.find(params[:id])
    @map_data = :worked_hours
  end
end