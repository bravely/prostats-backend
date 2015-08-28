class TournamentSerializer < ActiveModel::Serializer
  cache key: 'tournaments', expires_in: 1.hour
  attributes :id, :name, :finished, :season, :starts_at, :ends_at

  belongs_to :league, serializer: LeagueSmallSerializer
  belongs_to :series, serializer: SeriesSmallSerializer
  belongs_to :winner, serializer: TeamSmallSerializer
  has_many :matches, serializer: MatchSmallSerializer
  # has_many :games
end
