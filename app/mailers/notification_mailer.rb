class NotificationMailer < ApplicationMailer
  default from: 'ploy54218740@gmail.com'

  def send_submission_notification(admin_article)
    @admin_article = admin_article
    mail(to: 'NannapatSrimartpirom@gmail.com', subject: 'New Article Submission')
  end
end
