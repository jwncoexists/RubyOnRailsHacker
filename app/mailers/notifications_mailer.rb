class NotificationsMailer < ActionMailer::Base
  default from: "rubyonrailshacker@gmail.com"

  def new_message(message)
    @message = message
    mail to: "rubyonrailshacker@gmail.com", subject: "Ruby On Rails Hacker: #{message.subject}"
  end
end
