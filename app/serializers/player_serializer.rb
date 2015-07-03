class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :handle, :real_name, :position, :season_wins, :season_losses
end
