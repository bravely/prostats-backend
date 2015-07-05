require 'rails_helper'

RSpec.describe Api::V1::LeaguesController, type: :controller do
  describe 'GET #index, format: :json' do
    let!(:lcs) { FactoryGirl.create(:league_with_teams) }
    let!(:lck) { FactoryGirl.create(:league_with_teams) }
    before do
      get :index
    end
    it { should respond_with :ok }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(assigns[:leagues]).to include(lcs, lck) }
    it 'includes teams of each league' do
      response_json = JSON.parse(response.body)
      expect(response_json['included'].length).to eq(lcs.teams.length + lck.teams.length)
    end
  end

  describe 'GET #show, format: :json' do
    let(:lpl) { FactoryGirl.create(:league_with_teams) }
    before do
      get :show, id: lpl.id
    end
    it { should respond_with :ok }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(assigns[:league]).to eq lpl }
  end
end
