require 'faker'
module CampaignHelpers

  def create_campaign
    c1 = FactoryBot.build(:campaign, name: "c1", description: "c1")
    c1.save!
  end

end
