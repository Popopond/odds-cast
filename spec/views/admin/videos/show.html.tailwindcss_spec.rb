require 'rails_helper'

RSpec.describe "admin/videos/show", type: :view do
  before(:each) do
    assign(:admin_video, Admin::Video.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
