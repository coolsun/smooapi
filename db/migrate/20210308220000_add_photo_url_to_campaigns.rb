class AddPhotoUrlToCampaigns < ActiveRecord::Migration[6.1]
    def change
        add_column :campaigns, :photo_url, :string
    end
end