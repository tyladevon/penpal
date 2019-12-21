class ActivityPreference < ApplicationRecord
  belongs_to :user
  attr_reader :description
  validates_presence_of :description


end
