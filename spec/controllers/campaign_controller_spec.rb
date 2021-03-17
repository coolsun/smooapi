require 'rails_helper'

describe Api::CampaignsController, type: :request do

  let (:user) { create_user }
  let (:category) { create_category }
  let (:campaign) { create_campaign }
  let (:name) { "CampaignsController" }

  context 'When fetching all campaigns' do
    before do
      get "/api/campaigns/all_campaigns"
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
      #expect(json['data']).to eq("campaign")
    end



  end

  context 'When testing json jbuilder' do
    before do
      get "/api/campaigns/test_json"

    end
    
    it 'returns 200' do
      #Rails.logger.info "#{response.inspect}"
      expect(response.status).to eq(200)
      expect(json['campaign']).to eq(1)
    end



  end



end
