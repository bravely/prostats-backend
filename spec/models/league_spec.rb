require 'rails_helper'

RSpec.describe League, type: :model do
  describe '#name' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe '#region' do
    it { should have_db_column(:region).of_type(:string) }
  end

  describe '#abbr' do
    it { should have_db_column(:abbr).of_type(:string) }
  end

  describe '#teams' do
    it { should have_many(:teams) }
  end

  describe '#lolesports_id' do
    it { is_expected.to have_db_column(:lolesports_id).of_type(:integer) }
  end

  describe '#tournaments' do
    it { is_expected.to have_many(:tournaments) }
  end

  describe '#harvest', vcr: true do
    let(:api_league) { LolesportsApi::League.find(1) }
    let(:league) { League.harvest(api_league) }
    it { expect(league.lolesports_id).to eq api_league.id }
    it { expect(league.name).to eq api_league.label }
  end
end
