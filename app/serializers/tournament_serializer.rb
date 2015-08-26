class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :finished, :season, :starts_at, :ends_at

  belongs_to :league, serializer: LeagueSmallSerializer
  belongs_to :series, serializer: SeriesSmallSerializer
  belongs_to :winner, serializer: TeamSmallSerializer
  has_many :matches, serializer: MatchSmallSerializer
  # has_many :games
end
