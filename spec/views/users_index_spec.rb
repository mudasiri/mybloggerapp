require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  before do
    visit users_path
  end

  scenario 'Displays name, profile picture, and post count for all users' do
    sleep(1)
    expect(page).to have_content('Clement')
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/15003328?v=4']")
    expect(page).to have_css('li.user div.post-counter-details p', text: 'Number of posts: 0')
    expect(page).to have_css('li.user', count: 3)
  end

  scenario 'Clicking on a user redirects to their show page' do
    user = User.find_by(name: 'Clement')
    click_on 'Clement'
    sleep(1)
    expect(current_path).to eq(user_path(user.id))
  end
end
