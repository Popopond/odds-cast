require "rails_helper"



RSpec.shared_examples "Contents" do |content_class, root_path|
  let!(:content) { content_class.create!(title: "Sample Content", description: "Sample description", state: "draft") }


  scenario "User views all contents" do
    visit_contents_page
    expect_contents_to_be_displayed
  end

  scenario "User submits content for review" do
    visit_content_edit_page
    click_on "Submit for Review"

    expect(page).to have_content("State: in_review")
  end

  scenario "User approves content" do
    content.update(state: "in_review")
    visit_content_edit_page
    click_on "Approve"

    expect(page).to have_content("State: published")
  end

  scenario "User rejects content" do
    content.update(state: "in_review")
    visit_content_edit_page
    click_on "Reject"

    expect(page).to have_content("State: draft")
  end
  private
  def visit_contents_page
    visit "#{root_path}/contents"
  end

  def visit_content_edit_page
    visit "#{root_path}/contents/#{content.id}/edit"
  end

  def expect_contents_to_be_displayed
    expect(page).to have_content(content.title)
    expect(page).to have_content(content.description)
    expect(page).to have_content("State: draft")
  end
end
