class RegistrationMailer < ActionMailer::Base
  default from: "postmaster@jennifernelson.io"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.registration.subject
  #
  def registration_confirmation(user, url)
    @url = url
    @user = user
    mail to: user.email, subject: "Registration Confirmation for Jennifer Nelson's Blog"
  end
end
