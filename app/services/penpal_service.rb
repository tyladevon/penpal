class PenpalService

  def get_suggestion
    { type: 'activity', data: nil }
    { type: 'buddy', data: nil }
    { type: 'journal', data: nil }
    { type: 'media', data: { url: '', alt_text: '' } }
    { type: 'music',
      data: {
        song_name: '',
        artist_name: '',
        song_url: '',
        image: '',
        track_id: ''
      }
    }
  end

  private

    def conn
      Faraday.new(ENV['PENPAL_URL']) do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def get_json
      response = conn.get
      JSON.parse(response.body)
    end
end
