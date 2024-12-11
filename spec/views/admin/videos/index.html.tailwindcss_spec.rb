require 'rails_helper'

RSpec.describe "admin/videos/index", type: :view do
  before(:each) do
    assign(:admin_videos, [
      Admin::Video.create!(),
      Admin::Video.create!()
    ])
  end

  it "renders a list of admin/videos" do
    render
    cell_selector = 'div>p'
  end
end
