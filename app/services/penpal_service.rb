class PenpalService

  def get_suggestion(user_info)
    get_json(user_info)
  end

  private

    def conn(user_info)
      Faraday.new(ENV['PENPAL_URL']) do |f|
        f.adapter Faraday.default_adapter
        f.params[:user_info] = user_info
      end
    end

    def get_json(user_info)
      response = conn.get
      JSON.parse(response.body)
    end
end
