# encoding: UTF-8

class TasksController < ApplicationController
  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.question_id = params[:question_id]
    if @task.save
      redirect_to main_app.citizen_path(params[:citizen_id]), flash: { success: 'Úkol byl přidán.' }
    else
      render 'new'
    end    
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to main_app.citizen_path(params[:citizen_id]), flash: { success: 'Úkol byl smazán.' }
  end
end