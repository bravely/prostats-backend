require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#played_at' do
    it { should have_db_column(:played_at).of_type(:datetime) }
  end

  describe '#notes' do
    it { should have_db_column(:notes).of_type(:text) }
  end

  describe '#youtube_picks' do
    it { should have_db_column(:youtube_picks).of_type(:string) }
  end

  describe '#youtube_start' do
    it { should have_db_column(:youtube_start).of_type(:string) }
  end

  describe '#twitch_picks' do
    it { should have_db_column(:twitch_picks).of_type(:string) }
  end

  describe '#twitch_start' do
    it { should have_db_column(:twitch_start).of_type(:string) }
  end

  describe '#blue_team' do
    it { should belong_to(:blue_team) }
  end

  describe '#red_team' do
    it { should belong_to(:red_team) }
  end

  describe '#winner' do
    it { should belong_to(:winner) }
  end

  describe '#players' do
    it { should have_many(:players) }
  end

  describe '#plays' do
    it { should have_many(:plays) }
  end

  describe '#lolesports_id' do
    it { should have_db_column(:lolesports_id).of_type(:integer) }
  end

  describe '#game_length' do
    it { should have_db_column(:game_length).of_type(:integer) }
  end

  describe '#match' do
    it { should belong_to(:match) }
  end

  describe '#winner_id' do
    it { should have_db_column(:winner_id).of_type(:integer) }
  end

  describe '#legs_url' do
    it { should have_db_column(:legs_url).of_type(:string) }
  end

  describe '#game_number' do
    it { should have_db_column(:game_number).of_type(:integer) }
  end

  describe '#youtube_url' do
    it { should have_db_column(:youtube_url).of_type(:string) }
  end

  describe '#blue_team_players' do
    context 'when no players are assigned' do
      let(:team) { FactoryGirl.create(:team_with_players) }
      let(:game) { FactoryGirl.create(:game, blue_team: team) }
      it { expect(game.blue_team_players).to eq team.players }
    end

    context 'when players are assigned' do
      let(:player) { FactoryGirl.create(:player_with_full_team) }
      let(:game) do
        FactoryGirl.build(:game, blue_team: player.team) do |game_played|
          game_played.players << player
          game_played.save
        end
      end
      it { expect(game.blue_team_players).to eq [player] }
    end
  end

  describe '#red_team_players' do
    context 'when no players are assigned' do
      let(:team) { FactoryGirl.create(:team_with_players) }
      let(:game) { FactoryGirl.create(:game, red_team: team) }
      it { expect(game.red_team_players).to eq team.players }
    end

    context 'when players are assigned' do
      let(:player) { FactoryGirl.create(:player_with_full_team) }
      let(:game) do
        FactoryGirl.build(:game, red_team: player.team) do |game_played|
          game_played.players << player
          game_played.save
        end
      end
      it { expect(game.red_team_players).to eq [player] }
    end
  end

  describe '#harvest', vcr: true do
    context 'when an api object is not provided' do
      let(:api_game) do
        LolesportsApi::Game.find(7069).tap do |game|
          game.players.each do |play|
            FactoryGirl.create(:player, lolesports_id: play.player_id)
          end
        end
      end
      let(:game) { Game.new(lolesports_id: api_game.id).harvest }
      it { expect(game.game_number).to eq api_game.game_number }
      it { expect(game.legs_url).to eq api_game.legs_url }
      it { expect(game.youtube_url).to eq api_game.youtube_url }
      it { expect(game.plays.size).to eq 10 }
    end
    context 'when an api object is provided' do
      let(:api_game) do
        LolesportsApi::Game.find(7069).tap do |game|
          game.players.each do |play|
            FactoryGirl.create(:player, lolesports_id: play.player_id)
          end
        end
      end
      let(:game) { Game.new(lolesports_id: api_game.id).harvest(api_game) }
      it { expect(game.game_number).to eq api_game.game_number }
      it { expect(game.legs_url).to eq api_game.legs_url }
      it { expect(game.youtube_url).to eq api_game.youtube_url }
      it { expect(game.plays.size).to eq 10 }
    end
    context 'when a hash is provided' do
      let(:api_game) do
        LolesportsApi::Game.find(7069).tap do |game|
          game.players.each do |play|
            FactoryGirl.create(:player, lolesports_id: play.player_id)
          end
        end
      end
      let(:game) { Game.new(lolesports_id: api_game.id).harvest(api_game, game_number: 48) }
      it { expect(game.game_number).to eq 48 }
      it { expect(game.legs_url).to eq api_game.legs_url }
      it { expect(game.youtube_url).to eq api_game.youtube_url }
      it { expect(game.plays.size).to eq 10 }
    end
  end
end
