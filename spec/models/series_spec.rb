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

  describe '#harvest', vcr: true do
    context 'when an api object is not provided' do
      let(:api_series) { LolesportsApi::Series.find(20) }
      let(:series) { Series.new(lolesports_id: api_series.id).harvest }
      it { expect(series.lolesports_id).to eq 20 }
      it { expect(series.name).to eq 'NA LCS Expansion' }
    end
    context 'when an api object is provided' do
      let(:api_series) { LolesportsApi::Series.find(20) }
      let(:series) { Series.new(lolesports_id: api_series.id).harvest(api_series) }
      it { expect(series.lolesports_id).to eq 20 }
      it { expect(series.name).to eq 'NA LCS Expansion' }
    end
    context 'when a hash is provided' do
      let(:api_series) { LolesportsApi::Series.find(20) }
      let(:series) { Series.new(lolesports_id: api_series.id).harvest(api_series, name: 'Test') }
      it { expect(series.lolesports_id).to eq api_series.id }
      it { expect(series.name).to eq 'Test' }
    end
  end

  describe '#finished' do
    context 'with no tournaments' do
      let(:series) { FactoryGirl.create(:series) }
      it { expect(series.finished?).to eq false }
    end
    context 'with tournaments that have not finished' do
      let(:series) { FactoryGirl.create(:series) }
    end
  end
end
