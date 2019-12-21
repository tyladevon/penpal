require 'rails_helper'

describe TimePreference do
  describe 'validations' do
    it { should validate_presence_of :morning}
    it { should validate_presence_of :midday}
    it { should validate_presence_of :before_bed}
    it { should validate_presence_of :random}
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
