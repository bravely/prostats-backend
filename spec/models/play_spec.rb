require 'rails_helper'

RSpec.describe Play, type: :model do
  describe '#player' do
    it { should belong_to(:player) }
    it { should validate_presence_of(:player) }
  end

  describe '#team' do
    it { should belong_to(:team) }

    let(:player) { FactoryGirl.create(:player_with_team) }
    let(:play) { FactoryGirl.create(:play, player: player) }
    it { expect(play.team).to eq player.team }
  end

  describe '#game' do
    it { should belong_to(:game) }
    it { should validate_presence_of(:game) }
  end

  describe '#kills' do
    it { is_expected.to have_db_column(:kills).of_type(:integer) }
  end

  describe '#deaths' do
   it { is_expected.to have_db_column(:deaths).of_type(:integer) }
  end

  describe '#assists' do
    it { is_expected.to have_db_column(:assists).of_type(:integer) }
  end

  describe '#kda' do
    it { is_expected.to have_db_column(:kda).of_type(:decimal) }
  end

  describe '#champion_id' do
    it { is_expected.to have_db_column(:champion_id).of_type(:integer) }
  end

  describe '#end_level' do
    it { is_expected.to have_db_column(:end_level).of_type(:integer) }
  end

  describe '#total_gold' do
    it { is_expected.to have_db_column(:total_gold).of_type(:integer) }
  end

  describe '#minions_killed' do
    it { is_expected.to have_db_column(:minions_killed).of_type(:integer) }
  end

  describe '#first_spell' do
    it { is_expected.to have_db_column(:first_spell).of_type(:integer) }
  end

  describe '#second_spell' do
    it { is_expected.to have_db_column(:second_spell).of_type(:integer) }
  end

  describe '#item0' do
    it { is_expected.to have_db_column(:item0).of_type(:integer) }
  end

  describe '#item1' do
    it { is_expected.to have_db_column(:item0).of_type(:integer) }
  end

  describe '#item2' do
    it { is_expected.to have_db_column(:item0).of_type(:integer) }
  end

  describe '#item3' do
    it { is_expected.to have_db_column(:item0).of_type(:integer) }
  end

  describe '#item4' do
    it { is_expected.to have_db_column(:item0).of_type(:integer) }
  end

  describe '#item5' do
    it { is_expected.to have_db_column(:item0).of_type(:integer) }
  end

  describe '#position' do
    it { is_expected.to have_db_column(:position).of_type(:integer) }
  end

  describe '#harvest', vcr: true do
    let(:player) { FactoryGirl.create(:player_with_team) }
    let(:game) { FactoryGirl.create(:game) }
    let(:api_play) { LolesportsApi::Game.find(7069).players[0] }
    let(:play) { Play.new.harvest(api_play, game: game, player: player, team: player.team) }
    it { expect(play.kills).to eq api_play.kills }
    it { expect(play.kda).to eq api_play.kda }
    it { expect(play.item0).to eq api_play.items[0] }
  end
end
