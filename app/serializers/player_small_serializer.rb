class PlayerSmallSerializer < ActiveModel::Serializer
  cache key: 'players_small', expires_in: 1.hour
  attributes :id, :handle, :position, :first_name, :last_name, :season_wins,
             :season_losses, :starter, :contract_expires_at
end
