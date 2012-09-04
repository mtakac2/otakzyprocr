# encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :block_citizen_without_question
  before_filter :find_all_questions

  protected

    def block_citizen_without_question
      if session[:user_type] == 'Refinery::Citizens::Citizen' && current_user.questions.empty?
        redirect_to main_app.questions_path, :notice => 'Veberte otazku!!!'
      end
    end

    def find_all_questions
      @questions = Refinery::Questions::Question.order(:created_at)
    end

  private

    def current_user
      if session[:user_type] == 'Refinery::Citizens::Citizen'
        @current_user ||= Refinery::Citizens::Citizen.find(session[:user_id]) if session[:user_id]
      end

      if session[:user_type] == 'Refinery::Keepers::Keeper'
        @current_user ||= Refinery::Keepers::Keeper.find(session[:user_id]) if session[:user_id]
      end

      @current_user
    end
    helper_method :current_user

    def authorized_politician_access?
      unless session[:user_id] && session[:user_type] == 'Refinery::Keepers::Keeper'
        redirect_to '/', :notice => 'Unauthorized access'
      end
    end
    helper_method :authorized_politician_access?

    def authorized_citizen_access?
      unless session[:user_id] && session[:user_type] == 'Refinery::Citizens::Citizen'
        redirect_to '/', :notice => 'Unauthorized access'
      end
    end
    helper_method :authorize_citizen_access?

    def authorized_user_access?      
      unless current_user.id == params[:id].to_i
        redirect_to '/', :notice => 'Na požadovanou akci nemáte oprávnění.'
      end
    end

    def redirect_logged_in_user
      if current_user
        redirect_to '/'
      end
    end
end