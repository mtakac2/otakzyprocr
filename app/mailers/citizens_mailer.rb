class CitizensMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.citizens_mailer.registraion.subject
  #
  def registration(citizen, question)
    @email = Refinery::Emails::Email.find_by_for('citizens_registration')
    @citizen = citizen        

    mail(to: @citizen.email, subject: 'Registration') do |format|
      format.html
      format.text
    end
  end
end
