require 'rails_helper'

RSpec.feature 'Post new page', type: :feature do
  let(:user_ids) { User.pluck(:id) }
  let(:post) { Post.first }
  before do
    visit new_user_post_path(user_id: user_ids.last)
  end

  scenario 'Displays form to create a new comments a single user' do
    sleep(1)
    expect(page).to have_content('Adding New Post')
    expect(page).to have_content('Title')
    expect(page).to have_content('Text')
  end

  scenario 'Clicking on add new post redirects to index page for posts' do
    click_button 'Add Post' 
    sleep(1)
    expect(current_path).to eq(user_posts_path(user_id: user_ids.last))
  end
end
