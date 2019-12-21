class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :google_token
  validates_uniqueness_of :email

  has_many :buddies
  has_many :feelings
  has_many :feeling_categories
  has_one :music_preference
  has_one :media_preference
  has_one :activity_preference
  has_one :time_preference
end
