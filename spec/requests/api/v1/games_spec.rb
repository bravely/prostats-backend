require 'rails_helper'

RSpec.describe 'Games API', type: :request do
  describe 'GET /api/games/:id' do
    let(:game) { FactoryGirl.create(:game_with_full_teams) }
    before do
      get api_game_path id: game.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq game.id }
    it { expect(json_included_ids('plays')).to include(*game.plays.pluck(:id)) }
    it { expect(json_included_ids('players')).to include(*game.players.pluck(:id)) }
  end
end
