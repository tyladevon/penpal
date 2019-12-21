class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :google_token
  validates_uniqueness_of :email

  has_many :buddies
  has_many :feelings
  has_many :feeling_categories
  has_many :music_preferences
  has_many :media_preferences
  has_many :activity_preferences
  has_many :time_preferences
end
