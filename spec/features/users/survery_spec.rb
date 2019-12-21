require 'rails_helper'


  describe 'User can fill out the survey' do
    it 'fills out information and submits' do
      user = create(:user)
      stub_user(user)

      visit '/survey'

      check 'Sad'
      check 'Down'
      check 'Before bed'
      check 'Listen to my favorite music'
      check 'Perform an activity I enjoy'
      check 'Folk/Indie'
      check 'Dogs'
      check 'Celestial'
      fill_in 'activity[activity_1]', with: 'Swimming'
      fill_in 'activity[activity_2]', with: 'Coloring'

      click_on 'Submit'

      expect(current_path).to eq('/landing')
      expect(page).to have_content('Preferences saved')

      feelings = user.feeling_preferences.map do |pref|
        pref.feeling
      end


      expect(feelings).to include('sad')
      expect(feelings).to include('down')

      expect(user.time_preference).to include('Before bed')

      expect(user.music_preferences).to include('Folk/Indie')

      expect(user.media_preference).to include('Dogs')
      expect(user.media_preference).to include('Celestial')

      expect(user.activity_preferences).to include('Listen to my favorite music')
      expect(user.activity_preferences).to include('Perform an activity I enjoy')
      expect(user.activity_preferences).to include('Swimming')
      expect(user.activity_preferences).to include('Coloring')

    end
  end
