# encoding: UTF-8

class StatsController < ApplicationController
  def index
    @stats = Stat.new
  end
end