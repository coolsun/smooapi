json.all_campaigns do 
    json.array! @all_campaigns do |campaign|
        json.campaign campaign.to_json(methods: [:goal_reached, :campaign_started])
        json.user campaign.user
    end
end