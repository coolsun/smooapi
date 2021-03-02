class Campaign < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments
    has_many :campaign_donations, dependent: :delete_all
    has_many :donations, through: :campaign_donations
end