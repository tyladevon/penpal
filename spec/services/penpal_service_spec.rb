require 'rails_helper'

describe 'Can receive suggestion from penpal api' do
  it 'can get a journal suggestion' do
    VCR.use_cassette('can_get_a_journal_suggestion', :record => :none) do
      user = create(:user, survey?: true )

      journal = PenpalService.get_suggestion({
        current_feeling: 'sad',
        feeling_preferences: ['sad', 'down'],
        resource_preferences: ['journal'],
        media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
        spotify_token: nil }.to_json)

      expect(journal).to be_a(Hash)
      expect(journal).to have_key(:type)
      expect(journal).to have_key(:data)

      expect(journal[:type]).to eq('journal')
      expect(journal[:data]).to eq(nil)
    end
  end
  it 'can get a buddy suggestion' do
    VCR.use_cassette('can_get_a_buddy_suggestion', :record => :none) do
      user = create(:user, survey?: true )

      buddy = PenpalService.get_suggestion({
        current_feeling: 'sad',
        feeling_preferences: ['sad', 'down'],
        resource_preferences: ['buddy'],
        media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
        spotify_token: nil }.to_json)

      expect(buddy).to be_a(Hash)
      expect(buddy).to have_key(:type)
      expect(buddy).to have_key(:data)

      expect(buddy[:type]).to eq('buds')
      expect(buddy[:data]).to eq(nil)
    end
  end
  it 'can get a activity suggestion' do
    VCR.use_cassette('can_get_a_activity_suggestion', :record => :none) do

      user = create(:user, survey?: true )

      activity = PenpalService.get_suggestion({
        current_feeling: 'sad',
        feeling_preferences: ['sad', 'down'],
        resource_preferences: ['activity'],
        media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
        spotify_token: nil }.to_json)

      expect(activity).to be_a(Hash)
      expect(activity).to have_key(:type)
      expect(activity).to have_key(:data)

      expect(activity[:type]).to eq('activity')
      expect(activity[:data]).to eq(nil)
    end
  end
  it 'can get a media suggestion' do
    VCR.use_cassette('can_get_a_media_suggestion', :record => :none) do
      user = create(:user, survey?: true )

      media = PenpalService.get_suggestion({
        current_feeling: 'sad',
        feeling_preferences: ['sad', 'down'],
        resource_preferences: ['media'],
        media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
        spotify_token: nil }.to_json)

      expect(media).to be_a(Hash)
      expect(media).to have_key(:type)
      expect(media).to have_key(:data)

      expect(media[:type]).to eq('media')
      expect(media[:data]).to be_a(Hash)
    end
  end
  it 'can get a music suggestion' do
    VCR.use_cassette('can_get_a_music_suggestion', :record => :none) do
      user = create(:user, survey?: true )

      music = PenpalService.get_suggestion({
        current_feeling: 'sad',
        feeling_preferences: ['sad', 'down'],
        resource_preferences: ['music'],
        music_preferences: ['rock'],
        media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false },
        spotify_token: ENV['SPOTIFY_TEST_TOKEN'] }.to_json)

      expect(music).to be_a(Hash)
      expect(music).to have_key(:type)
      expect(music).to have_key(:data)

      expect(music[:type]).to eq('music')
      expect(music[:data]).to be_a(Hash)
    end
  end
end
