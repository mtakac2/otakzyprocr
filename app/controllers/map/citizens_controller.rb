# encoding: utf-8

class Map::CitizensController < ApplicationController
  layout 'map'

  def index
    @title = 'Voliči'
    @counties = Refinery::Counties::County.all
    @questions = Refinery::Questions::Question.order('created_at DESC')
    @map_data = :citizens
    @citizens = true
  end

  def show    
    @counties = Refinery::Counties::County.all
    @question = Refinery::Questions::Question.find(params[:id])
    @citizens_count = CitizensQuestion.where('question_id = ?', @question.id).count
    @map_data = :citizens
    @citizens = true
  end 
end