require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '#name' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe '#location' do
    it { should have_db_column(:location).of_type(:string) }
  end

  describe '#players' do
    it { should have_many(:players) }
  end

  describe '#league' do
    it { should belong_to(:league) }
  end

  describe '#lolesports_id' do
    it { is_expected.to have_db_column(:lolesports_id).of_type(:integer) }
  end

  describe '#acronym' do
    it { is_expected.to have_db_column(:acronym).of_type(:string) }
  end

  describe '#wins' do
    it { is_expected.to have_db_column(:wins).of_type(:integer).with_options(default: 0) }
  end

  describe '#losses' do
    it { is_expected.to have_db_column(:losses).of_type(:integer).with_options(default: 0) }
  end

  describe '.harvest', vcr: true do
    context 'when an api object is provided' do
      let(:api_team) { LolesportsApi::Team.find(304) }
      let(:team) { Team.new(lolesports_id: api_team.id).harvest(api_team) }
      it { expect(team.lolesports_id).to eq api_team.id }
      it { expect(team.acronym).to eq 'C9' }
    end
    context 'when an api object is not provided' do
      let(:api_team) { LolesportsApi::Team.find(304) }
      let(:team) { Team.new(lolesports_id: api_team.id).harvest }
      it { expect(team.lolesports_id).to eq api_team.id }
      it { expect(team.acronym).to eq 'C9' }
    end
    context 'when a hash is provided' do
      let(:api_team) { LolesportsApi::Team.find(304) }
      let(:team) { Team.new(lolesports_id: api_team.id).harvest(api_team, acronym: 'Test') }
      it { expect(team.lolesports_id).to eq api_team.id }
      it { expect(team.acronym).to eq 'Test' }
    end
  end
end
