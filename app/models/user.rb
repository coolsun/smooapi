class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :donations
  has_many :campaigns
  has_many :comments
end
