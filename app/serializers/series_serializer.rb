class SeriesSerializer < ActiveModel::Serializer
  cache key: 'series', expires_in: 1.hour
  attributes :id, :name, :season, :finished

  belongs_to :league, serializer: LeagueSmallSerializer
  has_many :tournaments, serializer: TournamentSmallSerializer
end
