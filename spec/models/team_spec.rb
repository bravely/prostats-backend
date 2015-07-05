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
end
