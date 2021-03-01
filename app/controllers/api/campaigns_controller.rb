class Api::CampaignsController < Api::BaseController
    def index
        all_campaigns = Campaign.all
        render json: all_campaigns.to_json
    end

    def show
        campaign = Campaign.find_by(id: params[:id])
        render json: campaign.to_json
    end
end