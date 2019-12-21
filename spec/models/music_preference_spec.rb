require 'rails_helper'

describe MusicPreference do
  describe 'validations' do
    it { should validate_presence_of :genre }

  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
