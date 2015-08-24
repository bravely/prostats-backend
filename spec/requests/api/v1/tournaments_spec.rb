require 'rails_helper'

RSpec.describe 'Api::V1::Tournaments', type: :request do
  describe 'GET /api/tournaments/:id' do
    let(:tournament) { FactoryGirl.create(:tournament_with_matches_and_games) }
    before do
      get api_tournament_path id: tournament.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq tournament.id }
    it { expect(json_included_ids('matches')).to include(*tournament.matches.map(&:id)) }
    it { expect(json_included_ids('games')).to include(*tournament.games.map(&:id)) }
  end
end
