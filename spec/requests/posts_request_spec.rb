require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users/96/posts') }
    it 'should return success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'it renders index template' do
      expect(response).to render_template(:index)
    end

    it 'should have a body' do
      expect(response.body).to include('This is my third post')
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/96/posts/108') }
    it 'should return success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'it renders index template' do
      expect(response).to render_template(:show)
    end

    it 'should have a body' do
      expect(response.body).to include('Mancoba : Awesome!')
    end
  end
end
