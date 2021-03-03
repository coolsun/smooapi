class CreateCampaigns < ActiveRecord::Migration[6.1]
    def change
        create_table :campaigns do |t|
            t.belongs_to :user, index: true, foreign_key: true
            t.belongs_to :category, index: true, foreign_key: true
            t.string :name
            t.string :description
            t.decimal :goal, precision: 8, scale: 2
            t.timestamps
        end
    end
end
