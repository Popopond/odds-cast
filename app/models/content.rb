# app/models/content.rb
class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true
  has_one_attached :photo
  
  # กำหนด enum state ด้วย stateful_enum
  enum :state, { draft: 0, in_review: 1, published: 2 }, default: :draft

  # เพิ่ม methods ที่ใช้ในการเปลี่ยนสถานะ
  def submit_for_review!
    update!(state: :in_review)
  end

  def approve!
    update!(state: :published)
  end

  def reject!
    update!(state: :draft)
  end
end
