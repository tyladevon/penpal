class TimePreference < ApplicationRecord
  attr_reader :morning, :midday, :before_bed, :random
  validates_presence_of :morning, :midday, :before_bed, :random
  belongs_to :user

end
