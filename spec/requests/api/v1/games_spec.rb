require 'rails_helper'

RSpec.describe 'Games API', type: :request do
  describe 'GET /api/games' do
    context 'with no query params' do
      let!(:game_one) { FactoryGirl.create(:game) }
      let!(:game_two) { FactoryGirl.create(:game) }
      before do
        get api_games_path
      end
      it { expect(response).to be_success }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(json['data'].map { |e| e['id'].to_i }).to include(game_one.id, game_two.id) }
    end
    context 'with query params' do
      let(:match) { FactoryGirl.create(:match) }
      let!(:game_with_match) { FactoryGirl.create(:game, match: match) }
      let!(:game_without) { FactoryGirl.create(:game) }
      before do
        get api_games_path match_id: match.id
      end
      it { expect(response).to be_success }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(json['data'].map { |e| e['id'].to_i }).to include(game_with_match.id) }
      it { expect(json['data'].map { |e| e['id'].to_i }).to_not include(game_without.id) }
    end
    context 'with player_id query param' do
      let(:player) { FactoryGirl.create(:player) }
      let!(:game_without_player) { FactoryGirl.create(:game) }
      let!(:game_with_player) do
        FactoryGirl.create(:game).tap do |game|
          game.players << player
        end
      end
      before do
        get api_games_path player_id: player.id
      end
      it { expect(response).to be_success }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(json['data'].map { |e| e['id'].to_i }).to include(game_with_player.id) }
      it { expect(json['data'].map { |e| e['id'].to_i }).to_not include(game_without_player.id) }
    end
  end

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
