require 'rails_helper'

RSpec.describe 'Api::V1::Leagues', type: :request do
  describe 'GET /api/leagues' do
    let!(:league_one) { FactoryGirl.create(:league_with_series_and_tournaments) }
    let!(:league_two) { FactoryGirl.create(:league_with_series_and_tournaments) }
    before do
      get api_leagues_path
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data'].map { |e| e['id'].to_i }).to include(league_one.id, league_two.id) }
  end

  describe 'GET /api/leagues/:id' do
    let(:league) { FactoryGirl.create(:league_with_series_and_tournaments) }
    before do
      get api_league_path id: league.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq league.id }
    it { expect(json_included_ids('series')).to include(*league.series.map(&:id)) }
    # it { expect(json_included_ids('tournaments')).to include(*league.tournaments.map(&:id)) }
  end
end
