require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  let(:user) { User.last }
  let(:user_ids) { User.pluck(:id) }
  let(:post) { Post.first }
  before do
    visit "/users/#{user_ids.last}/posts/#{post.id}"
  end

  scenario 'Displays post text and comments details' do
    expect(page).to have_content('Mancoba : Well Done!')
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('Like')
    expect(page).to have_css('section', count: 1)
    expect(page).to have_css('button', count: 2)
  end

  scenario 'Should increase to likes counter' do
    expect(page).to have_content('Comments: 7, Likes: 0')
    click_button 'Like'
    expect(page).to have_content('Comments: 7, Likes: 1')
    click_button 'Like'
    expect(page).to have_content('Comments: 7, Likes: 2')
  end

  scenario 'Should create a comment on the post' do
    @comment = Comment.new(post:, author: user, text: 'Hi man, great work there!')
    expect(page).to have_css('p.comment', count: 7)
    click_button 'Add a comment'
    sleep(1)
    fill_in 'Text', with: @comment.text
    click_button 'Add Comment'
    expect(page).to have_css('p.comment', count: 8)
    expect(current_path).to eq("/users/#{user_ids.last}/posts/#{post.id}")
  end
end
