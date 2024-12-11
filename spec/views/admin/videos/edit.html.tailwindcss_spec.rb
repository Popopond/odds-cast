require 'rails_helper'

RSpec.describe "admin/videos/edit", type: :view do
  let(:admin_video) {
    Admin::Video.create!()
  }

  before(:each) do
    assign(:admin_video, admin_video)
  end

  it "renders the edit admin_video form" do
    render

    assert_select "form[action=?][method=?]", admin_video_path(admin_video), "post" do
    end
  end
end
