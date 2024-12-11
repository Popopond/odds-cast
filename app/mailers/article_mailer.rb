class ArticleMailer < ApplicationMailer
    default from: 'pimpakan2545@gmail.com'  # ตั้งค่าอีเมลต้นทาง

    def review_notification(article)
    @article = article
    @user = article.user  # สมมุติว่าแต่ละบทความมีการเชื่อมโยงกับผู้ใช้ (สามารถปรับให้เหมาะสมกับแอปของคุณ)

    mail(to: @user.email, subject: "Your article is now in review")
    end
    def notify_content_submitted(content)
        @content = content
        mail(to: "recipient@example.com", subject: "Article in Review")  # แก้ไขให้เหมาะสมกับอีเมลของคุณ
      end
end
