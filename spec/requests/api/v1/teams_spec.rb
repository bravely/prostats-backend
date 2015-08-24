require 'rails_helper'

RSpec.describe 'Api::V1::Teams', type: :request do
  describe 'GET /api/teams' do
    let!(:team_one) { FactoryGirl.create(:team) }
    let!(:team_two) { FactoryGirl.create(:team) }
    before do
      get api_teams_path
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data'].map { |e| e['id'].to_i }).to include(team_one.id, team_two.id) }
  end

  describe 'GET api/teams/:id' do
    let(:team) { FactoryGirl.create(:team_with_players_and_matches) }
    before do
      get api_team_path id: team.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq team.id }
    it { expect(json_included_ids('players')).to include(*team.players.pluck(:id)) }
    it { expect(json_included_ids('matches')).to include(*team.games.pluck(:id)) }
  end
end
