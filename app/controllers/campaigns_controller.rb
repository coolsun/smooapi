class CampaignsController < ApplicationController
    def all_campaigns
        all_campaigns = Campaign.all
        render json: all_campaigns.to_json
    end

    def comments
        comments = Campaign.find_by(id: params[:id]).try(:comments)
        render json: comments.to_json
    end    

    def show
        campaign = Campaign.find_by(id: params[:id])
        render json: campaign.to_json
    end
end