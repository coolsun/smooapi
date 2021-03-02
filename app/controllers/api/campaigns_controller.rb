class Api::CampaignsController < Api::BaseController

    def my_campaigns
        all_campaigns = current_user.campaigns
        render json: all_campaigns.to_json
    end    

end