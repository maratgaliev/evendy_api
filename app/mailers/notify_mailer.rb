class NotifyMailer < ApplicationMailer
  def help
    @greeting = 'Hi'
    mail to: 'to@example.org'
  end
end
