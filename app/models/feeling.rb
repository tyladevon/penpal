class Feeling < ApplicationRecord
  belongs_to :user
  validates_presence_of :feeling
  attr_reader :feeling


end
