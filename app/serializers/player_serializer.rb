class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :handle, :position, :first_name, :last_name, :season_wins,
             :season_losses

  belongs_to :team, serializer: TeamSmallSerializer
  # has_many :games
end
