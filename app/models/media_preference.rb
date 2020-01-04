class MediaPreference < ApplicationRecord
  belongs_to :user
  attr_reader :dogs, :cats, :babies, :landscapes, :celestial

end
