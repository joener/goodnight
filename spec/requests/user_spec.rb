require 'rails_helper'

RSpec.describe 'User', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }

  describe 'POST api/v1/users#create' do
    before do
      post '/api/v1/users', params: { name: user.name}
    end

    it 'returns the name' do
      expect(json['user']['name']).to eq(user.name)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST api/v1/users#follow' do
    before do
      post '/api/v1/users/follow', params: {
        user_id: user.id,
        follower_id: user2.id
      }
    end

    it 'returns the success message' do
      expect(json['message']).to eq("user followed successfully")
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST api/v1/users#unfollow' do
    before do
      post '/api/v1/users/follow', params: {
        user_id: user.id,
        follower_id: user2.id
      }
      post '/api/v1/users/unfollow', params: {
        user_id: user.id,
        follower_id: user2.id
      }
    end

    it 'returns the success message' do
      expect(json['message']).to eq("user unfollowed successfully")
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
