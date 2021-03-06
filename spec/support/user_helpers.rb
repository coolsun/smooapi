require 'faker'
module UserHelpers

  def build_user
    u1 = FactoryBot.build(:user, 
      email: Faker::Internet.email, 
      password: Faker::Internet.password,
      first_name: 'John',
      last_name: 'Ottos'
    )
  end

  def create_user
    u1 = FactoryBot.create(:user, 
      email: Faker::Internet.email, 
      password: Faker::Internet.password,
      first_name: 'John',
      last_name: 'Ottos'
    )
  end

end
