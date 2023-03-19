require 'rails_helper'

RSpec.describe 'Timecard', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:timecard) { FactoryBot.create(:timecard, user_id: user.id) }

  describe 'GET /api/v1/timecards#index' do
    before do
      get '/api/v1/timecards', params: { user_id: user.id }
    end

    it 'returns all posts' do
      expect(json['timecards'].size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/timecards#time_in' do
    before do
      post '/api/v1/timecards/time_in', params: {
        user_id: user.id
      }
    end

    it 'returns the user id' do
      expect(json['timecard']['user_id']).to eq(user.id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/timecards#time_out' do
    before do
      post '/api/v1/timecards/time_out', params: {
        user_id: user.id
      }
    end

    it 'returns the user id' do
      expect(json['timecard']['user_id']).to eq(user.id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
