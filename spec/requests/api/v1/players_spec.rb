require 'rails_helper'

RSpec.describe 'Api::V1::Players', type: :request do
  describe 'GET /api/players' do
    let!(:player_one) { FactoryGirl.create(:player) }
    let!(:player_two) { FactoryGirl.create(:player) }
    before do
      get api_players_path
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data'].map { |e| e['id'].to_i }).to include(player_one.id, player_two.id) }
  end

  describe 'GET api/players/:id' do
    let(:player) { FactoryGirl.create(:player_with_team) }
    before do
      get api_player_path id: player.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq player.id }
    it { expect(json_included_ids('games')).to include(*player.games.pluck(:id)) }
  end
end
