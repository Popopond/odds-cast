RSpec.shared_examples "Contents" do |contentable, contents_path|
  let(:new_button) { "New #{contentable}" }
  let(:create_button) { "Submit" }  # เปลี่ยนคำว่า 'Create article' เป็น 'Submit'

  scenario "user create contents" do
    visit contents_path
    click_on new_button
    fill_in 'Title', with: 'test7'
    fill_in 'Description', with: 'test7777'
    click_on create_button  # ปุ่มที่มีข้อความ 'Submit'
    expect(page).to have_content('test7')
  end
end
