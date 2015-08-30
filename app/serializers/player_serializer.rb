class PlayerSerializer < ActiveModel::Serializer
  cache key: 'players', expires_in: 1.hour
  attributes :id, :handle, :position, :first_name, :last_name, :season_wins,
             :season_losses, :starter, :contract_expires_at

  belongs_to :team, serializer: TeamSmallSerializer
  # has_many :games
end
