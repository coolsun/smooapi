require 'faker'
module CategoryHelpers

  def create_category
    FactoryBot.create(:category, name: "emergency", description: "find donation for emergency")
  end

end
