json.all_campaigns do 
    json.array! @all_campaigns do |campaign|
        json.campaign do
            json.merge! campaign.attributes
            hash = {"campaign_started":campaign.campaign_started,"goal_reached":campaign.goal_reached}
            json.merge! hash
        end
        json.user campaign.user
    end
end