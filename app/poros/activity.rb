class Activity
  attr_reader :description

  def initialize(data, user)
    @description = user.resource_preferences.sample.description
  end
end
