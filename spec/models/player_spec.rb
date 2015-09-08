require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#handle' do
    it { should have_db_column(:handle).of_type(:string) }
  end

  describe '#position' do
    it { should have_db_column(:position).of_type(:integer) }
    it { should allow_value(nil).for(:position) }
    it { should allow_value('top').for(:position) }
    it do
      should define_enum_for(:position).with(
        top: 0,
        jungle: 1,
        middle: 2,
        marksman: 3,
        support: 4
      )
    end
  end

  describe '#season_wins' do
    it { should have_db_column(:season_wins).of_type(:integer) }
    it { should allow_value(nil).for(:season_wins) }
    it { should allow_value(2).for(:season_wins) }
  end

  describe '#season_losses' do
    it { should have_db_column(:season_losses).of_type(:integer) }
    it { should allow_value(nil).for(:season_losses) }
    it { should allow_value(2).for(:season_losses) }
  end

  describe '#team' do
    it { should belong_to(:team) }
  end

  describe '#plays' do
    it { should have_many(:plays) }
  end

  describe '#games' do
    it { should have_many(:games) }
  end

  describe '#first_name' do
    it { should have_db_column(:first_name).of_type(:string) }
  end

  describe '#last_name' do
    it { should have_db_column(:last_name).of_type(:string) }
  end

  describe '#starter' do
    it { should have_db_column(:starter).of_type(:boolean) }
  end

  describe '#hometown' do
    it { should have_db_column(:hometown).of_type(:string) }
  end

  describe '#contract_expires_at' do
    it { should have_db_column(:contract_expires_at).of_type(:datetime) }
  end

  describe '#residency' do
    it { should have_db_column(:residency).of_type(:string) }
  end

  describe '#facebook_url' do
    it { should have_db_column(:facebook_url).of_type(:string) }
  end

  describe '#twitter_url' do
    it { should have_db_column(:twitter_url).of_type(:string) }
  end

  describe '#lolesports_id' do
    it { is_expected.to have_db_column(:lolesports_id).of_type(:integer) }
  end

  describe '#harvest', vcr: true do
    context 'when an api object is provided' do
      let(:api_player) { LolesportsApi::Player.find(329) }
      let(:player) { Player.new(lolesports_id: api_player.id).harvest(api_player) }
      it { expect(player.lolesports_id).to eq api_player.id }
      it { expect(player.position).to eq Player::LOLESPORTS_ROLE[api_player.role].to_s }
      it { expect(player.handle).to eq api_player.name }
    end
    context 'when an api object is not provided' do
      let(:api_player) { LolesportsApi::Player.find(329) }
      let(:player) { Player.new(lolesports_id: api_player.id).harvest }
      it { expect(player.lolesports_id).to eq api_player.id }
      it { expect(player.position).to eq Player::LOLESPORTS_ROLE[api_player.role].to_s }
      it { expect(player.handle).to eq api_player.name }
    end
    context 'when a hash is provided' do
      let(:api_player) { LolesportsApi::Player.find(329) }
      let(:player) { Player.new(lolesports_id: api_player.id).harvest(api_player, handle: 'Cliff') }
      it { expect(player.lolesports_id).to eq api_player.id }
      it { expect(player.position).to eq Player::LOLESPORTS_ROLE[api_player.role].to_s }
      it { expect(player.handle).to eq 'Cliff' }
    end
  end
end
