RSpec.shared_exaples "Contents" do |root_path|
  # Reordered code for better understanding of what is happening

  scenario "User views all contents" do
    visit_contents_page
    expect_contents_to_be_displayed
  end

  scenario "User views all contents" do
    visit_contents_page
    expect_contents_to_be_displayed
  end
end