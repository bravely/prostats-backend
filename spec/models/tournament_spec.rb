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
end
