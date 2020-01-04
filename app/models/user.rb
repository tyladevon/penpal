class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :google_token
  validates_uniqueness_of :email

  has_many :buddies
  has_many :feeling_preferences
  has_many :daily_feelings
  has_many :activity_preferences
  has_many :feeling_categories
  has_many :music_preferences
  has_one :media_preference
  has_one :time_preference
end
