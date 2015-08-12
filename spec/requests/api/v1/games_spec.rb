require 'rails_helper'

RSpec.describe 'Games API', type: :request do
  describe 'GET /api/games' do
    let!(:game_one) { FactoryGirl.create(:game_with_full_teams) }
    let!(:game_two) { FactoryGirl.create(:game_with_full_teams) }
    before do
      get api_games_path
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data'].map { |e| e['id'].to_i }).to include(game_one.id, game_two.id) }
    it { expect(json['included'].length).to eq 4 } # num of teams
  end

  describe 'GET /api/games/:id' do
    let(:game) { FactoryGirl.create(:game_with_full_teams) }
    before do
      get api_game_path id: game.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq game.id }
    it 'includes all relevant plays' do
      expect(
        json['included'].map do |e|
          e['id'].to_i if e['type'] == 'plays'
        end.compact
      ).to include(*game.plays.map(&:id))
    end
  end
end
