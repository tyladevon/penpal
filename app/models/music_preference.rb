class MusicPreference < ApplicationRecord
  attr_reader :rock, :rnb_soul, :folk_indie, :custom, :custom2
  validates_presence_of :rock, :rnb_soul, :folk_indie, :custom, :custom2
  belongs_to :user

end
