# encoding: UTF-8

class CitizensMailer < ActionMailer::Base
  default from: "admin@otazkyprocr.cz"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.citizens_mailer.registraion.subject
  #
  def registration(citizen, question)
    @email = Refinery::Emails::Email.find_by_for('citizens_registration')
    @citizen = citizen        

    mail(to: @citizen.email, subject: @email.title) do |format|
      format.html
      format.text
    end
  end

  def password_reset(citizen)
    @citizen = citizen
    mail :to => @citizen.email, :subject => "Změna hesla"
  end
end