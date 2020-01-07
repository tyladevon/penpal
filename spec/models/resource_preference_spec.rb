require 'rails_helper'

describe ResourcePreference do
  describe 'relationships' do
    it { should belong_to :user }
  end
  describe 'validations' do
    it { should validate_presence_of :media }
    it { should validate_presence_of :journal }
    it { should validate_presence_of :music }
    it { should validate_presence_of :buddy }
    it { should validate_presence_of :activity }
  end
end
