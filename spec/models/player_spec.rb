require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#handle' do
    it { should have_db_column(:handle).of_type(:string) }
  end

  describe '#real_name' do
    it { should have_db_column(:real_name).of_type(:string) }
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

  describe 'returns in the proper order' do
    let!(:shy) { FactoryGirl.create(:player, handle: 'Shy') }
    let!(:bjergerking) { FactoryGirl.create(:player, handle: 'Bjergsen') }

    it { expect(Player.all).to eq [bjergerking, shy] }
  end
end
