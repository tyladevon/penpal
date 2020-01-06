class PenpalService

  def get_suggestion
    {type: 'activity', data: nil}
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
