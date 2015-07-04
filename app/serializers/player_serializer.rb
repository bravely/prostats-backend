class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :handle, :position
  attribute :real_name, key: 'real-name'
  attribute :season_wins, key: 'season-wins'
  attribute :season_losses, key: 'season-losses'
end
