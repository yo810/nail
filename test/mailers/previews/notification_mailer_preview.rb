# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  
  def welcome_email
    notification = Notification.new(last_name: 'テスト', email: 'test@example.com', content: 'テスト送信。')
    NotificationMailer.welcome_email(notification)
  end

end
