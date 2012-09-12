# encoding: UTF-8

class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = Refinery::Citizens::Citizen.find_by_email(params[:email])
    user.next_step
    if user
      if user.update_attributes(password_reset_token: SecureRandom.urlsafe_base64, password_reset_sent_at: Time.zone.now)
        CitizensMailer.password_reset(user).deliver
      end
    end    
    redirect_to '/', flash: { message: "Na Váš email byly zaslány instrukce pro změnu hesla." }
  end

  def edit
    @user = Refinery::Citizens::Citizen.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = Refinery::Citizens::Citizen.find_by_password_reset_token(params[:id])
    @user.next_step

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to main_app.new_password_reset_path, :alert => "Platnost žádosti o změnu hesla vypršela."
    elsif @user.update_attributes(params[:citizen])
      redirect_to '/', :notice => "Vaše heslo bylo úspěšně změněno."
    else
      render :edit
    end
  end
end