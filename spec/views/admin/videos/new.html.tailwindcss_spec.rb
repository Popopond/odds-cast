require 'rails_helper'

RSpec.describe "admin/videos/new", type: :view do
  before(:each) do
    assign(:admin_video, Admin::Video.new())
  end

  it "renders new admin_video form" do
    render

    assert_select "form[action=?][method=?]", admin_videos_path, "post" do
    end
  end
end
