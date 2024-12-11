require 'rails_helper'

RSpec.describe Admin::ArticlesController, type: :controller do
  let(:article) { create(:article, content: build(:content, state: :draft)) }

  it "should send an email when an article is submitted for review" do
    # คาดหวังว่า ArticleMailer จะถูกเรียกใช้
    expect(ArticleMailer).to receive(:notify_content_submitted).with(article.content).and_return(
      double(deliver_later: true)
    ).times(1)

    # จำลองการส่งคำขอโพสต์เพื่อส่งบทความไปยังสถานะ 'in_review'
    # สมมุติว่าแอดมินสามารถเข้าถึงได้ผ่าน path โดยไม่ต้องล็อกอิน
    post :update, params: { 
      id: article.id, 
      admin_article: { 
        title: article.title, 
        content_attributes: { 
          state: 'in_review'  # อัปเดตสถานะเป็น 'in_review'
        }
      }
    }

    # ตัวเลือกในการตรวจสอบ response ถ้าจำเป็น
    expect(response).to redirect_to(admin_article_path(article))  # หรือ path ที่ควรจะไปหลังการอัปเดต
  end
end
