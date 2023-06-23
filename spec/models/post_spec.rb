require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Tom', posts_counter: 1) }
  let(:post) do
    Post.create(title: 'This is a title', text: 'This is my first post', likes_counter: 2, comments_counter: 1,
                author: user)
  end

  it 'increments the user posts counter' do
    user.increment!(:posts_counter)
    expect(user.posts_counter).to eq(2)
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).not_to be_valid
  end

  it 'is not valid with a blank title' do
    post.title = ''
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post.comments_counter = -1
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post.likes_counter = -1
    expect(post).not_to be_valid
  end

  it 'is valid with a title and non-negative counters' do
    expect(post).to be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    post.title = 'a' * 251
    expect(post).not_to be_valid
    expect(post.title.length).to be > 250
  end

  it 'post has likes' do
    expect(post.likes_counter).to be > 1
  end
end
