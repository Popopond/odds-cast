require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :controller do
    let(:article) { create(:admin_article, content: build(:content, state: :draft)) }
  
    it "should send an email when an article is submitted for review" do
        # เรียกใช้งาน NotificationMailer
        expect(NotificationMailer).to receive(:send_submission_notification).with(article).and_return(
          double(deliver_now: true)
        ).once
      
        post :update, params: { 
          id: article.id, 
          admin_article: { 
            content_attributes: { 
              state: 'in_review'
            }
          }
        }
      
        # ตรวจสอบว่า content เปลี่ยนเป็น in_review หรือไม่
        expect(article.reload.content.state).to eq('in_review')
        expect(response).to redirect_to(article)
      end
  end
  