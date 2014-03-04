class NotificationsMailer < ActionMailer::Base
  default from: "jenniferwnelson@sbcglobal.net"

  def new_message(message)
    @message = message
    mail to: "jenniferwnelson@sbcglobal.net", subject: "Jennifer Nelson: #{message.subject}"
  end
end
