require 'rails_helper'

# The serializer test framework used here came from Attila Gyorffy
# here: http://eclips3.net/2015/01/24/testing-active-model-serializer-with-rspec/
RSpec.describe TeamSerializer, type: :serializer do
  let(:player_count) { 6 }
  let(:resource) { FactoryGirl.create(:team_with_players_and_matches, player_count: player_count) }
  let(:serializer) { TeamSerializer.new(resource) }
  let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

  subject do
    JSON.parse(serialization.to_json)['data']
  end

  it 'has an id' do
    expect(subject['id'].to_i).to eq resource.id
  end

  it 'has the team name' do
    expect(subject['attributes']['name']).to eq resource.name
  end

  it 'has relationships including players' do
    expect(subject['relationships']['players']['data'].length).to eq player_count
  end

  it 'has a belongs_to relationship with a league' do
    expect(subject['relationships']['league']['data']['id'].to_i).to eq resource.league.id
  end
end
