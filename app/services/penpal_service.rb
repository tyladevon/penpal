class PenpalService

  def get_suggestion
    {type: 'music', data: { url: 'https://open.spotify.com/track/0dtuE679z6pgdEIMjgj26u?si=FMUDg1e2Sk24O6ZxptHBIA', song_name: 'Alive'}}
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
