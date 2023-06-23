require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }
    it 'should return success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'it renders index template' do
      expect(response).to render_template(:index)
    end

    it 'should have a body' do
      expect(response.body).to include('Number of posts: 5')
    end
  end

  describe 'GET /show' do

    before(:example) { get('/users/14') }

    it 'should return success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'it renders index template' do
      expect(response).to render_template(:show)
    end

    it 'should have a button for pagination' do
      expect(response.body).to include('See all posts')
    end
  end
end
