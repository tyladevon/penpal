class Music
  attr_reader :url, :song_name

  def initialize(data, user)
    @url = data[:url]
    @song_name = data[:song_name]
  end
end
