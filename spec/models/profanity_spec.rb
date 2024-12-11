require 'rails_helper'

RSpec.describe Admin::Article, type: :model do
  it "does not allow article creation with inappropriate language in title" do
    # สร้างอาร์ติคลใหม่ด้วย title ที่มีคำหยาบ
    article = Admin::Article.new(
      content_attributes: { title: 'This is a fuck example', description: 'Test description' }
    )

    # คาดหวังว่า article จะไม่ valid
    expect(article).not_to be_valid

    # คาดหวังว่า errors จะมีข้อผิดพลาดใน field :title
    expect(article.errors[:title]).to include('contains inappropriate language')
  end

  it "allows article creation with valid title" do
    # สร้างอาร์ติคลใหม่ที่มี title ที่ถูกต้อง
    article = Admin::Article.new(
      content_attributes: { title: 'Valid title', description: 'Test description' }
    )

    # คาดหวังว่า article จะ valid
    expect(article).to be_valid
  end
end
