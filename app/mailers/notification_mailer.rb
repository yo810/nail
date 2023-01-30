class NotificationMailer < ApplicationMailer

  # default from: 'notifications@example.com'

  def welcome_email(reservation)
    @customer = reservation.customer

    mail(
      from: 'mls357409@gmail.com',
      to:   'mls357409@gmail.com',
      # to: @customer.email,
      subject: '私の素敵なサイトへようこそ'
      )
  end
end
