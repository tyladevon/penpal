class ResourcePreference < ApplicationRecord
  belongs_to :user
  validates_presence_of :journal, :media, :music, :buddy, :activity
end
