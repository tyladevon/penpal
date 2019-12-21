class FeelingPreference < ApplicationRecord
  attr_reader :feeling
  belongs_to :user
  has_many :feeling_categories
  validates_presence_of :feeling


end
