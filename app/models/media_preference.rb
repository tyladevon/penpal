class MediaPreference < ApplicationRecord
  belongs_to :user
  attr_reader :dogs, :cats, :babies, :landscapes, :celestial
  validates_presence_of :dogs, :cats, :babies, :animals, :landscapes, :celestial

end
