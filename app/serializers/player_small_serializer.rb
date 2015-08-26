class PlayerSmallSerializer < ActiveModel::Serializer
  attributes :id, :handle, :position, :first_name, :last_name, :season_wins,
             :season_losses
end
