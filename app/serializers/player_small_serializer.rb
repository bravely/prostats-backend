class PlayerSmallSerializer < ActiveModel::Serializer
  attributes :id, :handle, :position
  attribute :first_name, key: 'first-name'
  attribute :last_name, key: 'last-name'
  attribute :season_wins, key: 'season-wins'
  attribute :season_losses, key: 'season-losses'
end