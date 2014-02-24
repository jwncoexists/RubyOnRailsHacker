class RegistrationMailer < ActionMailer::Base
  default from: "rubyonrailshacker@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.registration.subject
  #
  def registration_confirmation(user, url)
    @url = url
    @user = user
    mail to: user.email, subject: "Ruby On Rails Hacker Registration Confirmation"
  end
end
