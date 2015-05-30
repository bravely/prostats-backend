require 'rails_helper'

RSpec.describe Api::V1::PlayersController, type: :controller do
  describe 'GET #index, format: :json' do
    let!(:dyrus) { FactoryGirl.create(:player) }
    let!(:faker) { FactoryGirl.create(:player) }
    before do
      get :index
    end
    it { should respond_with :ok }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(assigns[:players]).to include(dyrus, faker) }
  end

  describe 'GET #show, format: :json' do
    let!(:hai) { FactoryGirl.create(:player) }
    before do
      get :show, id: hai.id
    end
    it { should respond_with :ok }
    it { expect(response.content_type).to eq 'application/json' }
    it { expect(assigns[:player]).to eq hai }
  end
end
