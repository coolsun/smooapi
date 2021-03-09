class Campaign < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments
    has_many :donations
    has_one_attached :photo

    # virtual columns
    attr_accessor :campaign_started, :goal_reached

    def campaign_started
        (Time.now - self.created_at).to_i/86400.to_i
    end

    def goal_reached
        self.donations.sum(:amount) / self.goal 
    end
end