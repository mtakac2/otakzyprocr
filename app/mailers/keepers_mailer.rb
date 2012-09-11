class KeepersMailer < ActionMailer::Base
  default from: "admin@otazkyprocr.cz"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.keepers_mailer.registration.subject
  #
  def registration(keeper, password)
    @email = Refinery::Emails::Email.find_by_for('keepers_registration')
    @keeper = keeper
    @password = password

    mail(to: @keeper.email, subject: @email.title) do |format|
      format.html
      format.text
    end
  end
end