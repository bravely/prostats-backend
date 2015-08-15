require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '#name' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe '#location' do
    it { should have_db_column(:location).of_type(:string) }
  end

  describe '#players' do
    it { should have_many(:players) }
  end

  describe '#league' do
    it { should belong_to(:league) }
  end

  describe '#lolesports_id' do
    it { is_expected.to have_db_column(:lolesports_id).of_type(:integer) }
  end

  describe '#acronym' do
    it { is_expected.to have_db_column(:acronym).of_type(:string) }
  end

  describe '#wins' do
    it { is_expected.to have_db_column(:wins).of_type(:integer).with_options(default: 0) }
  end

  describe '#losses' do
    it { is_expected.to have_db_column(:losses).of_type(:integer).with_options(default: 0) }
  end
end
