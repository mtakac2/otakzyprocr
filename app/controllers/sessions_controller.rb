# encoding: UTF-8

class SessionsController < ApplicationController
  def new
  end

  def create
    user = Refinery::Citizens::Citizen.find_by_email(params[:email]) || Refinery::Keepers::Keeper.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      if is_active?(user)
        session[:user_id] = user.id
        session[:user_type] = user.class.name

        if session[:return_url]
          return_url = session[:return_url]
          session[:return_url] = nil
          redirect_to return_url
        else
          redirect_to '/'
        end        
      else
        redirect_to '/', :notice => 'Váš účet nebyl aktivován.'
      end        
    else
      flash.now[:error] = "Zadal(a) jste nesprávný email nebo heslo. Nemáte ještě 
        svůj účet? <a href=\"#{main_app.new_citizen_path}\">Zaregistrujte se</a>. Nebo jste jen <a href=\"#\">
        zapomněl(a) své heslo</a>?".html_safe
      render 'new'
    end
  end

  def destroy
    session[:user_id] = session[:user_type] = nil
    redirect_to '/', :notice => 'Vaše odhlášení proběhlo úspěšně.'
  end

  private

    def is_active?(user)      
      user.activation_code == nil          
    end
end