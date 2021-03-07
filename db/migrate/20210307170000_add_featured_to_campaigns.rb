class AddFeaturedToCampaigns < ActiveRecord::Migration[6.1]
    def change
        add_column :campaigns, :featured, :boolean 
    end
end
