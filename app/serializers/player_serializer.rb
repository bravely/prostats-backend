class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :handle, :position
  attribute :first_name, key: 'first-name'
  attribute :last_name, key: 'last-name'
  attribute :season_wins, key: 'season-wins'
  attribute :season_losses, key: 'season-losses'

  belongs_to :team, serializer: TeamSmallSerializer
  # has_many :games
end
