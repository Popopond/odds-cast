FactoryBot.define do
    factory :content do
      title { "Sample Content Title" }
      description { "Sample Content Description" }
      state { :draft }  # กำหนดสถานะเริ่มต้นเป็น draft
  
      # ถ้าคุณต้องการให้มีรูปภาพ
      photo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'sample_image.jpg'), 'image/jpeg') }
  
      # หากต้องการสร้างการเชื่อมโยงกับ Article
      association :article, factory: :article
    end
  end