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
        @campaign = Campaign.find(params[:id])
        @comments = @campaign.comments
        h = { :campaign => @campaign, :comments => @comments }
        logger.info h
        render json: { :campaign => @campaign, :comments => @comments }
    end
end