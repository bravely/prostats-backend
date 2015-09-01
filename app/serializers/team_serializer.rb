class TeamSerializer < ActiveModel::Serializer
  cache key: 'teams', expires_in: 1.hour
  attributes :id, :name, :location, :acronym

  belongs_to :league, serializer: LeagueSmallSerializer
  has_many :players, serializer: PlayerSmallSerializer
  has_many :matches, serializer: MatchSmallSerializer
end
