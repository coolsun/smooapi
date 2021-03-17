FactoryBot.define do
  factory :campaign do
    name {"campaign name"}
    description {"campaign description"}
    goal {1000}
    association :category
    association :user
  end
end
