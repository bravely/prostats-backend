require 'rails_helper'

# The serializer test framework used here came from Attila Gyorffy
# here: http://eclips3.net/2015/01/24/testing-active-model-serializer-with-rspec/
RSpec.describe LeagueSerializer, type: :serializer do
  let(:league) { FactoryGirl.create(:league_with_series_and_tournaments) }
  let(:serializer) { LeagueSerializer.new(league) }
  let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

  subject do
    JSON.parse(serialization.to_json)['data']
  end

  it 'has an id' do
    expect(subject['id'].to_i).to eq league.id
  end

  it 'has the league name' do
    expect(subject['attributes']['name']).to eq league.name
  end

  it 'has series relationships' do
    expect(subject['relationships']['series']['data'].length).to eq league.series.size
  end

  # it 'has tournament relationships' do
  #   expect(subject['relationships']['tournaments']['data'].length).to eq league.tournaments.size
  # end
end
