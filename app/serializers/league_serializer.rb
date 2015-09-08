class LeagueSerializer < ActiveModel::Serializer
  cache key: 'leagues', expires_in: 1.hour
  attributes :id, :name, :region, :abbr

  has_many :series, serializer: SeriesSmallSerializer
  has_many :tournaments, serializer: TournamentSmallSerializer
end
