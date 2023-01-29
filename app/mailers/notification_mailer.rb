class NotificationMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def welcome_email
    @customer = @notification.reservation.customer

    mail(to: @customer.email, subject: '私の素敵なサイトへようこそ')
  end
end
