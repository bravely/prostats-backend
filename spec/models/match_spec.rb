require 'rails_helper'

RSpec.describe Match, type: :model do
  describe '#lolesports_id' do
    it { is_expected.to have_db_column(:lolesports_id).of_type(:integer) }
  end

  describe '#played_at' do
    it { is_expected.to have_db_column(:played_at).of_type(:datetime) }
  end

  describe '#live' do
    it { is_expected.to have_db_column(:live).of_type(:boolean) }
  end

  describe '#finished' do
    it { is_expected.to have_db_column(:finished).of_type(:boolean) }
  end

  describe '#max_games' do
    it { is_expected.to have_db_column(:max_games).of_type(:integer) }
  end

  describe '#name' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe '#tournament' do
    it { is_expected.to belong_to(:tournament) }
  end

  describe '#winner' do
    it { is_expected.to belong_to(:winner) }
  end

  describe '#blue_team' do
    it { is_expected.to belong_to(:blue_team) }
  end

  describe '#red_team' do
    it { is_expected.to belong_to(:red_team) }
  end

  describe '.with_team' do
    let(:team) { FactoryGirl.create(:team) }
    let(:match_one) { FactoryGirl.create(:match, blue_team: team) }
    let(:match_two) { FactoryGirl.create(:match, red_team: team) }
    let(:match_three) { FactoryGirl.create(:match) }
    subject { Match.with_team(team.id) }
    it { expect(subject).to include(match_one, match_two) }
    it { expect(subject).to_not include(match_three) }
  end

  describe '#harvest', vcr: true do
    context 'when an api object is not provided' do
      let(:api_match) { LolesportsApi::Match.find(5334) }
      let(:match) { Match.new(lolesports_id: api_match.id).harvest }
      it { expect(match.name).to eq api_match.name }
      it { expect(match.finished).to eq true }
    end
    context 'when an api object is provided' do
      let(:api_match) { LolesportsApi::Match.find(5334) }
      let(:match) { Match.new(lolesports_id: api_match.id).harvest(api_match) }
      it { expect(match.name).to eq api_match.name }
      it { expect(match.finished).to eq true }
    end
    context 'when a hash is provided' do
      let(:api_match) { LolesportsApi::Match.find(5334) }
      let(:match) { Match.new(lolesports_id: api_match.id).harvest(api_match, name: 'Test') }
      it { expect(match.finished).to eq true }
      it { expect(match.name).to eq 'Test' }
    end
  end
end
