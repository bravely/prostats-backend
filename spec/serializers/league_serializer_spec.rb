require 'rails_helper'

# The serializer test framework used here came from Attila Gyorffy
# here: http://eclips3.net/2015/01/24/testing-active-model-serializer-with-rspec/
RSpec.describe LeagueSerializer, type: :serializer do
  let(:team_count) { 3 }
  let(:resource) { FactoryGirl.create(:league_with_teams, team_count: team_count) }
  let(:serializer) { LeagueSerializer.new(resource) }
  let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

  subject do
    JSON.parse(serialization.to_json)['data']
  end

  it 'has an id' do
    expect(subject['id'].to_i).to eq resource.id
  end

  it 'has the league name' do
    expect(subject['attributes']['name']).to eq resource.name
  end

  it 'has relationships including teams' do
    expect(subject['relationships']['teams']['data'].length).to eq team_count
  end
end
