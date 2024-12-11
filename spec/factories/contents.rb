# spec/factories/contents.rb
FactoryBot.define do
    factory :content do
      state { :in_review } # หรือเปลี่ยนตามค่าที่คุณต้องการ
    end
  end
  