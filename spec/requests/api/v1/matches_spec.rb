require 'rails_helper'

RSpec.describe 'Api::V1::Matches', type: :request do
  describe 'GET /api/matches/:id' do
    let(:match) { FactoryGirl.create(:match_with_games) }
    before do
      get api_match_path id: match.id
    end
    it { expect(response).to be_success }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(json['data']['id'].to_i).to eq match.id }
    it { expect(json_included_ids('games')).to include(*match.games.map(&:id)) }
  end
end
