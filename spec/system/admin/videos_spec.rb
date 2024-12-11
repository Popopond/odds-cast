require "rails_helper"

RSpec.describe "Admin manages videos", type: :feature do
  let!(:video) do
    Video.create!(
      video_url: "https://example.com/test_video.mp4",
      content: Content.create!(
        title: "Test Video",
        description: "Test video description"
      )
    )
  end

  it "allows admin to create a video with image upload" do
    visit '/admin/videos/new'

    fill_in 'Title', with: 'New Test Video'
    fill_in 'Description', with: 'New test video description'
    fill_in 'Video url', with: 'https://example.com/new_test_video.mp4'
    attach_file('Cover', Rails.root.join('spec/fixtures/test_cover.jpeg'))

    click_on 'Submit'

    expect(page).to have_content('New Test Video')
    expect(page).to have_content('New test video description')
    expect(page).to have_css("img[src*='test_cover.jpeg']")
  end

  it "lists videos with images in the admin panel" do
    visit '/admin/videos'

    expect(page).to have_content('Test Video')
    expect(page).to have_content('Test video description')
    expect(page).to have_css("img[src*='test_cover.jpeg']")
  end

  it "allows admin to edit a video and update the image" do
    visit '/admin/videos'
    click_on 'Show this video'
    click_on 'Edit this video'

    fill_in 'Title', with: 'Updated Test Video'
    fill_in 'Description', with: 'Updated video description'
    fill_in 'Video url', with: 'https://example.com/updated_test_video.mp4'
    attach_file('Cover', Rails.root.join('spec/fixtures/updated_test_cover.jpeg'))

    click_on 'Submit'

    expect(page).to have_content('Updated Test Video')
    expect(page).to have_content('Updated video description')
    expect(page).to have_css("img[src*='updated_test_cover.jpeg']")
  end

  it "allows admin to delete a video" do
    visit '/admin/videos'
    click_on 'Show this video'
    click_on 'Destroy this video'

    expect(page).to have_content('Video was successfully destroyed.')
    visit '/admin/videos'

    expect(page).not_to have_content('Test Video')
  end
end
