require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe '#starts_at' do
    it { is_expected.to have_db_column(:starts_at).of_type(:datetime) }
  end

  describe '#ends_at' do
    it { is_expected.to have_db_column(:ends_at).of_type(:datetime) }
  end

  describe '#name' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe '#finished' do
    it { is_expected.to have_db_column(:finished).of_type(:boolean) }
  end

  describe '#league' do
    it { is_expected.to belong_to(:league) }
  end

  describe '#series' do
    it { is_expected.to belong_to(:series) }
  end

  describe '#matches' do
    it { is_expected.to have_many(:matches) }
  end

  describe '#games' do
    it { is_expected.to have_many(:games) }
  end

  describe '#last_played_at' do
    let!(:tournament) { FactoryGirl.create(:tournament) }
    let!(:match) { FactoryGirl.create(:match, tournament: tournament, finished: true) }
    before do
      tournament.reload
    end
    it { is_expected.to have_db_column(:last_played_at).of_type(:datetime) }
    it { expect(tournament.last_played_at).to eq match.played_at }
  end

  describe '#harvest', vcr: true do
    context 'when an api object is not provided' do
      let(:api_tournament) { LolesportsApi::Tournament.find(184) }
      let(:tournament) { Tournament.new(lolesports_id: api_tournament.id).harvest }
      it { expect(tournament.name).to eq 'NA Expansion Upper' }
      it { expect(tournament.finished?).to eq true }
    end
    context 'when an api object is provided' do
      let(:api_tournament) { LolesportsApi::Tournament.find(184) }
      let(:tournament) { Tournament.new(lolesports_id: api_tournament.id).harvest(api_tournament) }
      it { expect(tournament.name).to eq 'NA Expansion Upper' }
      it { expect(tournament.finished?).to eq true }
    end
    context 'when a hash is provided' do
      let(:api_tournament) { LolesportsApi::Tournament.find(184) }
      let(:tournament) { Tournament.new(lolesports_id: api_tournament.id).harvest(api_tournament, name: 'Test') }
      it { expect(tournament.finished?).to eq true }
      it { expect(tournament.name).to eq 'Test' }
    end
  end
end
