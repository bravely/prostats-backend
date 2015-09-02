require 'rails_helper'

RSpec.describe 'Api::V1::Matches', type: :request do
  describe 'GET /api/matches' do
    context 'with no query params' do
      let!(:match_one) { FactoryGirl.create(:match) }
      let!(:match_two) { FactoryGirl.create(:match) }
      before do
        get api_matches_path
      end
      it { expect(response).to be_success }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(json['data'].map { |e| e['id'].to_i }).to include(match_one.id, match_two.id) }
    end
    context 'with query params' do
      let(:tournament) { FactoryGirl.create(:tournament) }
      let!(:match_one) { FactoryGirl.create(:match, tournament: tournament) }
      let!(:match_two) { FactoryGirl.create(:match) }
      before do
        get api_matches_path tournament_id: tournament.id
      end
      it { expect(response).to be_success }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(json['data'].map { |e| e['id'].to_i }).to include(match_one.id) }
      it { expect(json['data'].map { |e| e['id'].to_i }).to_not include(match_two.id) }
    end
    context 'with team_id query param' do
      let(:team) { FactoryGirl.create(:team) }
      let!(:match_one) { FactoryGirl.create(:match, blue_team: team) }
      let!(:match_two) { FactoryGirl.create(:match) }
      before do
        get api_matches_path team_id: team.id
      end
      it { expect(response).to be_success }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(json['data'].map { |e| e['id'].to_i }).to include(match_one.id) }
      it { expect(json['data'].map { |e| e['id'].to_i }).to_not include(match_two.id) }
    end
  end

  describe 'GET /api/matches/:id' do
    let(:match) { FactoryGirl.create(:match_with_games) }
    before do
      get api_match_path id: match.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq match.id }
    it { expect(json_included_ids('games')).to include(*match.games.pluck(:id)) }
  end
end
