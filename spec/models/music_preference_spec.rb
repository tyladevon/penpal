require 'rails_helper'

describe MusicPreference do
  describe 'validations' do
    it { should validate_presence_of :rock}
    it { should validate_presence_of :rnb_soul}
    it { should validate_presence_of :folk_indie}
    it { should validate_presence_of :custom}
    it { should validate_presence_of :custom2}
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
