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
end
