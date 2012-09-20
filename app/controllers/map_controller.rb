# encoding: utf-8

class MapController < ApplicationController
  layout 'map'

  def index
    @title = 'Voliči'
    @counties = Refinery::Counties::County.all
    @questions = Refinery::Questions::Question.order('created_at DESC')
  end

  def promised_hours
    @title = 'Přislíbené hodiny'
    @counties = Refinery::Counties::County.all
    @questions = Refinery::Questions::Question.order('created_at DESC')
  end

  def worked_hours
    @title = 'Odrobené hodiny'
    @counties = Refinery::Counties::County.all
    @questions = Refinery::Questions::Question.order('created_at DESC')
  end  
end