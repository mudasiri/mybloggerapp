require 'rails_helper'

RSpec.feature 'Post index page', type: :feature do
  let(:user_ids) { User.pluck(:id) }
  let(:post) { Post.first }
  before do
    visit user_posts_path(user_id: user_ids.last)
  end

  scenario 'Displays details, posts and comments to the post for a single user' do
    sleep(1)
    expect(page).to have_content('Mancoba')
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/53082877?s=96&v=4']")
    expect(page).to have_content('Mancoba : Good review!')
    expect(page).to have_css('li.user', count: 1)
    expect(page).to have_css('li.post p.comment-heading', text: 'Comments: 7, Likes: 0')
    expect(page).to have_css('li.post', count: 5)
    expect(page).to have_css('p.comment', count: 5)
  end

  scenario 'Clicking on a see more post redirects to index page for posts' do
    click_button 'Add New Post'
    sleep(1)
    expect(current_path).to eq(new_user_post_path(user_id: user_ids.last))
  end

  scenario 'Should create a new post' do
    @post = Post.new(title: 'New Post Title', text: 'This is the new post text.')
    click_button 'Add New Post'
    sleep(1)
    fill_in 'Title', with: @post.title
    fill_in 'Text', with: @post.text
    click_button 'Add Post'
    expect(page).to have_css('li.post', count: 6)
    expect(current_path).to eq(user_posts_path(user_id: user_ids.last))
  end
end
