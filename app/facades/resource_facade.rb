class ResourceFacade
  attr_reader :suggestion, :resource

  def initialize(user)
    @user = user
  end

  def new_entry
    @entry ||= @user.journal_entries.new
  end

  def get_resource
    service = PenpalService.new
    raw_data = service.get_suggestion
    @suggestion = raw_data[:type]
    @resource = Object.const_get(raw_data[:type].capitalize).new(raw_data[:data], @user)
  end

  private

    def user_info
      {
        current_feeling: @user.daily_feelings.last.feeling,
        feeling_preferences: feeling_info,
        resource_preferences: resource_info,
        music_preferences: music_info,
        media_preferences: media_info,
        spotify_tokn: @user.spotify_token
      }
    end

    def feeling_info
      @user.feeling_preferences.map do|feeling_pref|
        feeling_pref.feeling
      end
    end

    def resource_info
<<<<<<< HEAD
      @user.resource_preferences.map do |pref, boolean|
        pref if boolean
      end
=======
      preferences = ['music', 'activity', 'buddy', 'media', 'journal']
      user_preferences = @user.resource_preference
      preferences.map do |preference|
        preference if user_preferences.send(preference)
      end.compact
>>>>>>> 39e3f95853930ebf6659e8b9f4992ed537f32540
    end


    def music_info
      @user.music_preferences.map do |preference|
        preference.genre
      end
    end

    def media_info
      media_info ||= @user.media_preference
      if media_info
        {
          dogs: media_info.dogs,
          cats: media_info.cats,
          babies: media_info.babies,
          animals: media_info.animals,
          celestial: media_info.celestial,
          landscapes: media_info.landscapes
        }
      end
    end
end
