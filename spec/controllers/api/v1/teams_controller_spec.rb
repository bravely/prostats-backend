require 'rails_helper'

RSpec.describe Api::V1::TeamsController, type: :controller do
  describe 'GET #index, format: :json' do
    let!(:tsm) { FactoryGirl.create(:team_with_players) }
    let!(:clg) { FactoryGirl.create(:team_with_players) }
    before do
      get :index
    end
    it { should respond_with :ok }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(assigns[:teams]).to include(tsm, clg) }
    it 'includes players of each team' do
      response_json = JSON.parse(response.body)
      expect(response_json['included'].length).to eq(tsm.players.length + clg.players.length)
    end
  end

  describe 'GET #show, format: :json' do
    let(:curse) { FactoryGirl.create(:team_with_players) }
    before do
      get :show, id: curse.id
    end
    it { should respond_with :ok }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(assigns[:team]).to eq curse }
  end
end
