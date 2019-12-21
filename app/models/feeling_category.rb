class FeelingCategory  < ApplicationRecord
  belongs_to :feeling
  belongs_to :user
  attr_reader :category
  validates_presence_of :category


end
