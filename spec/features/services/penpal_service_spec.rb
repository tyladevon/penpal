require 'rails_helper'

describe PenpalService do
  # it 'gets an activity/buddy/journal suggestion from penpal service api' do
  #  subject = PenpalService.new
  #  resource = subject.get_suggestion
  #
  #  expect(resource).to be_a Hash
  #  expect(resource).to have_key :type
  #  expect(resource).to have_key :data
  # end
  #
  # it 'gets a suggested media resource from penpal service api' do
  #   subject = PenpalService.new
  #   resource = subject.get_suggestion
  #
  #   expect(resource).to be_a Hash
  #   expect(resource).to have_key :type
  #   expect(resource).to have_key :data
  #   expect(resource[:data]).to have_key :url
  #   expect(resource[:data]).to have_key :alt_text
  # end

  it 'gets a suggested music resource from penpal service api' do
    subject = PenpalService.new
    resource = subject.get_suggestion

    expect(resource).to be_a Hash
    expect(resource).to have_key :type
    expect(resource).to have_key :data
    expect(resource[:data]).to have_key :song_name
    expect(resource[:data]).to have_key :artist_name
    expect(resource[:data]).to have_key :song_url
    expect(resource[:data]).to have_key :image
    expect(resource[:data]).to have_key :track_id
  end
end
