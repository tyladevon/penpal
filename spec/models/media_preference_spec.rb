require 'rails_helper'

describe MediaPreference do
  describe 'validations' do
    it { should validate_presence_of :dogs }
    it { should validate_presence_of :cats }
    it { should validate_presence_of :babies }
    it { should validate_presence_of :animals }
    it { should validate_presence_of :landscapes }
    it { should validate_presence_of :celestial }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
