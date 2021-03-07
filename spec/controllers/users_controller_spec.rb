require 'rails_helper'

describe Api::UsersController, type: :request do

  let (:user) { create_user}
  let (:name) { "UsersController" }


  context 'When fetching a user' do
    before do
      login_with_api(user)
      get "/api/users/#{user.id}", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns the user' do
      expect(json['data']).to have_id(user.id.to_s)
      expect(json['data']).to have_type('users')
    end
  end

  context 'When fetching campaigns' do
    before do
      login_with_api(user)
      Rails.logger.info ("response.headers['Authorization']:#{response.headers['Authorization']}")
      get "/api/campaigns", headers: {
        'Authorization': response.headers['Authorization']
      }
    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When creating a campaign' do
    res_head = nil
    before do
      login_with_api(user)
      Rails.logger.info ("response.headers['Authorization']:#{response.headers['Authorization']}")
      res_head = response.headers['Authorization']
      create_category
      post "/api/campaigns", params: {
        campaign: {
          'user_id': 1,
          'category_id': 1,
          'name': "this campaign is from rspec test",
          'goal': 1000
        }
      },
      headers: {
        'Authorization': res_head
      }
    end
    it 'creating a campaign' do
      expect(response.status).to eq(201)
    end
    it 'creating a comment' do
      post "/api/campaigns/create_comment", params: {
        comment: {
          'user_id': 1,
          'campaign_id': 1,
          'content': "this is from rspec test"
        }
      },
      headers: {
        'Authorization': res_head
      }

      expect(response.status).to eq(201)
    end
    it 'creating a donation' do
      post "/api/donations", params: {
        donation: {
          'user_id': 1,
          'campaign_id': 1,
          'amount': 150
        }
      },
      headers: {
        'Authorization': res_head
      }
      expect(response.status).to eq(201)
    end
  end

  context 'When fetching campaigns without headers' do
    before do
      login_with_api(user)
      Rails.logger.info ("response.headers['Authorization']:#{response.headers['Authorization']}")
      get "/api/campaigns"
    end
    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'When create a donation' do
    before do
      login_with_api(user)
      Rails.logger.info ("response.headers['Authorization']:#{response.headers['Authorization']}")

    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end
  

  context 'When a user is missing' do
    before do
      login_with_api(user)
      get "/api/users/blank", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 404' do
      expect(response.status).to eq(404)
    end
  end

  context 'When the Authorization header is missing' do
    before do
      get "/api/users/#{user.id}"
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

end
