class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :location

  belongs_to :league, serializer: LeagueSmallSerializer
  has_many :players, serializer: PlayerSmallSerializer
  has_many :matches, serializer: MatchSmallSerializer
end
