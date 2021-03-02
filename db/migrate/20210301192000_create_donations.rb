class CreateDonations < ActiveRecord::Migration[6.1]
    def change
        create_table :donations do |t|
            t.belongs_to :user, index: true, foreign_key: true
            t.belongs_to :campaign, index: true, foreign_key: true
            t.decimal :amount, precision: 8, scale: 2
            t.timestamps
        end
    end
end
