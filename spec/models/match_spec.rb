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
end
