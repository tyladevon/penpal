class FeelingPreference < ApplicationRecord
  belongs_to :user
  has_many :feeling_categories
  validates_presence_of :feeling
  attr_reader :feeling


end
