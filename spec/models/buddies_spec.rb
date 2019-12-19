require 'rails_helper'

describe Buddy do
  describe 'relationships' do
    it { should belong_to :user }
  end
end
