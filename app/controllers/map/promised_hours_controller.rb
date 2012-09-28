# encoding: utf-8

class Map::PromisedHoursController < ApplicationController
  layout 'map'

  def index
    @title = 'Přislíbené hodiny'
    @counties = Refinery::Counties::County.all
    @questions = Refinery::Questions::Question.order('created_at DESC')
    @map_data = :promised_hours
    @promised = true
  end

  def show
    @question = Refinery::Questions::Question.find(params[:id])
    @map_data = :promised_hours
    @promised = true
  end
end