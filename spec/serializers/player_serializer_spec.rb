require 'rails_helper'

# The serializer test framework used here came from Attila Gyorffy
# here: http://eclips3.net/2015/01/24/testing-active-model-serializer-with-rspec/
RSpec.describe PlayerSerializer, type: :serializer do
  let(:resource) { FactoryGirl.build(:player) }
  let(:serializer) { PlayerSerializer.new(resource) }
  let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

  subject do
    JSON.parse(serialization.to_json)['data']
  end

  it 'has an id' do
    expect(subject['id']).to_not eq nil
  end

  it 'has the handle' do
    expect(subject['attributes']['handle']).to eq resource.handle
  end
end
