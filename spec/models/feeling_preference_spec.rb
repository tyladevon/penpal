require 'rails_helper'

describe FeelingPreference do
  describe 'validations' do
    it { should validate_presence_of :feeling }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
