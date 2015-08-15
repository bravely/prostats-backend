require 'rails_helper'

RSpec.describe Series, type: :model do
  describe '#lolesports_id' do
    it { is_expected.to have_db_column(:lolesports_id).of_type(:integer) }
  end

  describe '#name' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe '#season' do
    it { is_expected.to have_db_column(:season).of_type(:string) }
  end

  describe '#tournaments' do
    it { is_expected.to have_many(:tournaments) }
  end

  describe '#league' do
    it { is_expected.to belong_to(:league) }
  end
end
