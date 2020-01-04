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

      expect(user.media_preference[:dogs]).to eq(true)
      expect(user.media_preference[:celestial]).to eq(true)

      expect(user.time_preference[:before_bed]).to eq(true)

      music = user.music_preferences.map do |pref|
        pref.genre
      end

      expect(music).to include('folkindie')

      activities = user.activity_preferences.map do |pref|
        pref.description
      end

      expect(activities).to include('Swimming')
      expect(activities).to include('Coloring')
      expect(activities).to include('music')
      expect(activities).to include('activity')

    end
  end
