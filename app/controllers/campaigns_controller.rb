class CampaignsController < ApplicationController
    def all_campaigns
        if session[:ttt].nil?
            session[:ttt] = 100
        else
            session[:ttt] += 1
        end
        logger.info "session[:ttt]=#{session[:ttt]}"
        
        all_campaigns = Campaign.all
        render json: all_campaigns.as_json(methods: [:goal_reached, :campaign_started])
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
        render json: { :campaign => @campaign.as_json(methods: [:goal_reached, :campaign_started]),
             :comments => @comments }
    end
end