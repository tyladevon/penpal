class MusicPreference < ApplicationRecord
  attr_reader :genre
  validates_presence_of :genre
  belongs_to :user

end
